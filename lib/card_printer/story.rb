require "card_printer"

class CardPrinter::Story
  ATTRS = [:story_type, :estimate, :name, :labels, :description]
  
  attr_accessor ATTRS

  def initialize(data = {})
    ATTRS.each do |attr_name|
      self.send(:"#{attr_name}=", data[attr_name])
    end
  end
end