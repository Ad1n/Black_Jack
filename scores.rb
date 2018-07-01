class Scores

  attr_accessor :scores

  def initialize(start_cards)
    @scores = 0
    self.scores = count_start_scores(start_cards)
  end

  def count_start_scores(cards)
    cards.each do |card|
      if card.to_i == 0 && card[0] == "T"
        self.scores += 11
      elsif card.to_i == 0 && card[0] != "T"
        self.scores += 10
      else
        self.scores += card.to_i
      end
    end
    self.scores
  end

  def add_scores(card)
    if card.to_i == 0 && card[0] == "T" && scores < 11
      self.scores += 11
    elsif card.to_i == 0 && card[0] == "T" && scores > 11
      self.scores += 1
    elsif card.to_i == 0 && card[0] != "T"
      self.scores += 10
    else
      self.scores += card.to_i
    end
  end
end
