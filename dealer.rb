class Dealer
  include CardDeck

  attr_accessor :scores, :cards_deck
  attr_reader :money

  def initialize(bank, player_name = nil)
    @cards_deck = start_cards
    @money = bank
    @scores = Scores.new(cards_deck)
  end

  def add_card
    cards_deck << CARD_DECK.sample
  end
end
