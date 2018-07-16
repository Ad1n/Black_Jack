class Card

  include Validation

  validate :card, :presence

  attr_reader :card

  def initialize(rank, suite)
    @card = rank + suite
    validate!
  rescue RuntimeError => e
    p e.inspect
  end

  def to_s
    "#{card[0]}  #{card[1]}"
  end
end
