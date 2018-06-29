class Diller
  include CardDeck

  attr_reader :start_cards_deck

  def initialize
    @start_cards_deck = start_cards
  end
end