require 'card_printer/parser'
require 'card_printer/parser/base'

class CardPrinter::Parser::CsvParser < CardPrinter::Parser::Base
  def parse_line(line)
    parsed = CSV.parse_line(line)
    if @headers
      Hash[@headers.zip(parsed)]
    else
      @headers = parsed
      nil
    end
  end
end

CardPrinter::Parser.register_parser('csv', CardPrinter::Parser::CsvParser)
