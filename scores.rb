class Scores

  attr_accessor :player_total_scores, :dealer_total_scores

  def initialize(player_start_card_scores, dealer_start_card_scores)
    @player_total_scores = count_start_scores(player_start_card_scores)
    @dealer_total_scores = count_start_scores(dealer_start_card_scores)
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
    total_scores
  end

  def add_scores(card)

  end

end