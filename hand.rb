class Hand

  include Validation

  validate :scores, :presence

  attr_accessor :scores

  def initialize(start_cards)
    @scores = 0
    self.scores = count_scores(start_cards)
  end

  def count_scores(cards)
    Array(cards).each do |card|
      if card.rank == "T" && scores < 11
        self.scores += 11
      elsif card.rank == "T" && scores > 11
        self.scores += 1
      elsif card.rank.to_i == 0 && card.rank != "T"
        self.scores += 10
      else
        self.scores += card.rank.to_i
      end
    end
    self.scores
  end
end
