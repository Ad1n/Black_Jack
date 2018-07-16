class Dealer

  include Validation

  attr_accessor :scores, :cards_deck, :money

  validate :money, :type, Bank
  validate :scores, :type, Scores

  def initialize(player_name = nil)
    @cards_deck = Deck.new.cards.sample(2)
    @money = Bank.new
    @scores = Scores.new(cards_deck)
    validate!
  end
end
