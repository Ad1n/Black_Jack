class Deck

  include Validation

  validate :cards, :presence

  SUITES = %w[♦ ♣ ♠ ♥].freeze
  RANKS = %w[2 3 4 5 6 7 8 9 10 В Д К Т].freeze

  attr_accessor :cards

  def initialize
    @cards = create_deck
    validate!
  rescue RuntimeError => e
    p e.inspect
  end

  def create_deck
    SUITES.each_with_object([]) do |value, suite|
      RANKS.each do |rank|
        suite << Card.new(rank, value)
      end
    end.shuffle!
  end

  def card_giver
    cards.sample
  end
end
