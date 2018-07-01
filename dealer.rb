class Dealer
  include CardDeck

  attr_accessor :scores
  attr_reader :cards_deck, :money

  def initialize(bank, player_name = nil)
    @cards_deck = start_cards
    @money = bank
    @scores = Scores.new(cards_deck)
  end

  def add_card
    cards_deck << CARD_DECK.sample
  end
end
