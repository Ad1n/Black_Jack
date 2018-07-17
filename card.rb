class Card

  include Validation

  validate :rank, :presence
  validate :suite, :presence

  attr_reader :rank, :suite

  def initialize(rank, suite)
    @rank = rank
    @suite = suite
    validate!
  rescue RuntimeError => e
    p e.inspect
  end

  def to_s
    "#{rank}  #{suite}"
  end
end
