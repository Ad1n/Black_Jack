class Diller
  include CardDeck

  attr_reader :start_cards_deck

  def initialize(dealer_money)
    @dealer_money = dealer_money
    @start_cards_deck = start_cards
  end

  def add_dealer_card
    start_cards_deck << CARD_DECK.sample
  end
end