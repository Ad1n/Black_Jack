class Game
  include UserInterface
  include Validation

  validate :total_bet, :type, Integer

  attr_accessor :total_bet, :laps
  attr_reader :player, :dealer

  def initialize
    create_players
    @total_bet = 0
    validate!
  end

  def start
    self.laps = 0
    loop do
      start_lap_info
      choice = game_actions
      case
      when choice == "1"
        dealer_turn(dealer.scores.scores)
      when choice == "2"
        player.cards_deck << Card.new.card
        player.scores.count_scores(player.cards_deck.last)
        dealer_turn(dealer.scores.scores)
      when choice == "3"
        show_cards
      else
        break
      end
      self.laps += 1
      game_result
      final_result
      break if self.laps == "exit"
    end
  end
end
