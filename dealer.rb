class Dealer
  include CardDeck

  attr_reader :start_cards_deck, :money

  def initialize(bank, player_name = nil)
    @start_cards_deck = start_cards
    @money = bank
  end

  def add_card
    start_cards_deck << CARD_DECK.sample
  end
end