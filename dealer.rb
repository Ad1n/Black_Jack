class Dealer

  include Validation

  attr_accessor :hand, :cards_deck, :money

  validate :money, :type, Bank
  validate :hand, :type, Hand

  def initialize(cards, player_name = nil)
    @cards_deck = cards
    @money = Bank.new
    @hand = Hand.new(cards_deck)
    validate!
  end

  def add_card(card)
    cards_deck << card
  end
end
