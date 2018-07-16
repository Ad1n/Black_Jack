class Game
  include Validation

  validate :total_bet, :type, Integer

  attr_accessor :total_bet, :ui

  def initialize
    @total_bet = 0
    validate!
  end

  def start
    begin
      p "Hello there! What is your name ?"
      name = gets.chomp!
      @ui = UserInterface.new(name)
      p "Lets dance #{ui.player.player_name} !"
    rescue RuntimeError => e
      p e.inspect
      retry
    end
    loop do
      bet if ui.laps.zero?
      ui.start_lap_info
      choice = ui.game_actions
      case
      when choice == "1"
        dealer_turn(ui.dealer.scores.scores)
      when choice == "2"
        ui.player.cards_deck << Deck.new.card_giver
        ui.player.scores.count_scores(ui.player.cards_deck.last)
        dealer_turn(ui.dealer.scores.scores)
      when choice == "3"
        ui.show_cards
      else
        break
      end
      ui.laps += 1
      ui.lap_result(game_result)
      ui.final_result
      start if ui.start == 1
      break if ui.laps == "exit"
    end
  end

  private

  def bet
    self.total_bet = 20
    ui.player.money.deposit -= 10
    ui.dealer.money.deposit -= 10
  end

  def dealer_turn(scores)
    if scores < 17
      ui.dealer.cards_deck << Deck.new.card_giver
      ui.dealer.scores.count_scores(ui.player.cards_deck.last)
    end
  end

  def game_result
    ui.show_cards
    if ui.player.scores.scores > ui.dealer.scores.scores && ui.player.scores.scores <= 21 || \
       ui.player.scores.scores < ui.dealer.scores.scores && ui.player.scores.scores == 21
      result = "win"
      ui.player.money.deposit += total_bet
    elsif ui.player.scores.scores == ui.dealer.scores.scores && ui.player.scores.scores <= 21
      result = "draw"
      ui.player.money.deposit += 10
      ui.dealer.money.deposit += 10
    else
      result = "lose"
      ui.dealer.money.deposit += total_bet
    end
    ui.player.cards_deck = Deck.new.cards.sample(2)
    ui.dealer.cards_deck = Deck.new.cards.sample(2)
    ui.player.scores = Scores.new(ui.player.cards_deck)
    ui.dealer.scores = Scores.new(ui.dealer.cards_deck)
    ui.laps = 0
    result
  end
end
