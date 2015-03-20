require 'card_printer/parser'
require 'card_printer/parser/base'

class CardPrinter::Parser::JsonLine < CardPrinter::Parser::Base
  def parse_line(line)
    JSON.parse(line)
  rescue
    nil
  end
end

CardPrinter::Parser.register_parser('json_lines', CardPrinter::Parser::JsonLine)
