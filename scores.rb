class Scores

  attr_accessor :scores

  def initialize(start_cards)
    @start_cards = count_start_scores(start_cards)
  end

  def count_start_scores(cards)
    total_scores = 0
    cards.each do |card|
      if card.to_i == 0 && card[0] == "T"
        total_scores += 11
      elsif card.to_i == 0 && card[0] != "T"
        total_scores += 10
      else
        total_scores += card.to_i
      end
    end
    self.scores = total_scores
  end

  def add_scores(card)

  end

end