class Deck

  attr_accessor :start_cards

  def initialize
    @start_cards = [Card.new.card, Card.new.card]
  end
end