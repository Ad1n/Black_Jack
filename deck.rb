class Deck

  include Validation

  validate :start_cards, :presence

  attr_accessor :start_cards

  def initialize
    @start_cards = [Card.new.card, Card.new.card]
    validate!
  end
end
