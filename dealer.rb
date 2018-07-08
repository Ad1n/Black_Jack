class Dealer

  attr_accessor :scores, :cards_deck, :money

  def initialize(bank, player_name = nil)
    @cards_deck = Deck.new.start_cards
    @money = bank
    @scores = Scores.new(cards_deck)
  end
end
