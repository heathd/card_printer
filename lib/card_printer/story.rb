require "card_printer"

class CardPrinter::Story
  # story_type = {feature|bug|chore|other}
  ATTRS = [:name, :description, :story_type, :estimate, :label]
  
  attr_accessor *ATTRS

  def initialize(data = {})
    ATTRS.each do |attr_name|
      self.send(:"#{attr_name}=", data[attr_name] || data[attr_name.to_s])
    end
  end
end