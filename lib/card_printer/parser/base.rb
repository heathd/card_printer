require 'card_printer'
require 'card_printer/parser'
require 'card_printer/story'

class CardPrinter::Parser::Base
  attr_reader :iostream

  def initialize(iostream)
    @iostream = iostream
  end

  def parse
    @iostream.each_line.map do |line|
      CardPrinter::Story.new(parse_line(line))
    end.compact
  end

  def parse_line(line)
    raise "parse_line not implemented"
  end
end
