require 'json'
require 'csv'
require 'card_printer'

module CardPrinter::Parser
  def self.parse(iostream, parser_type = default_parser)
    parser_for(parser_type).call(iostream)
  end

  def self.available_parsers
    @parsers.keys
  end

  def self.default_parser
    'trello_json_export'
  end

  def self.parser_for(parser_type)
    parser_class = @parsers.fetch(parser_type)
    ->(iostream) { parser_class.new(iostream).parse }
  end

  def self.register_parser(name, klass)
    @parsers[name] = klass
  end

private
  @parsers = {}
end

require 'card_printer/parser/csv'
require 'card_printer/parser/json_line'
require 'card_printer/parser/trello_json_export'
