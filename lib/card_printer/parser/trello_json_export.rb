require 'ostruct'
require 'card_printer/parser'
require 'card_printer/parser/base'

###*****
require 'pp'

class CardPrinter::Parser::TrelloJsonExport < CardPrinter::Parser::Base
  def parse
    lists.map do |list|
      list.cards.map do |card|
        story_from_card(list, card)
      end
    end.flatten
  end

  def data
    @data ||= JSON.load(iostream)
  end

  def lists
    data['lists'].map do |list|
      List.new(list).tap do |l|
        l.cards = cards_for_list_id(l.id)
      end
    end
  end

  def cards_for_list_id(list_id)
    data['cards'].select do |card|
      card['idList'] == list_id
    end.map do |card|
      Card.new(card)
    end
  end

  def story_from_card(list, card)
    CardPrinter::Story.new(
      name: "#{card.name}",
      description: card.desc,
      story_type: story_type(card),
      estimate: "",
      label: "",
      id: "##{card.idShort}"
    )
  end

  def story_type(card)
    case label_of(card)
    when /feature/i
      "feature"
    when /bug/i
      "bug"
    when /chore/i
      "chore"
    when /retro/i
      "retro"
    else
      "other"
    end
  end

  def label_of(card)
    if card.labels.any?
      card.labels.first['name']
    else
      ""
    end
  end

  class List < OpenStruct; end
  class Card < OpenStruct; end
end

CardPrinter::Parser.register_parser('trello_json_export', CardPrinter::Parser::TrelloJsonExport)
