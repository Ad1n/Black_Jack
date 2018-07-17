class Game
  include Validation

  validate :total_bet, :type, Integer

  attr_accessor :total_bet, :ui
  attr_reader :deck

  def initialize(name)
    @deck = Deck.new
    @ui = UserInterface.new(name, deck)
    @total_bet = 0
    validate!
  rescue RuntimeError => e
    p e.inspect
  end

  def start
    loop do
      bet if ui.laps.zero?
      ui.start_lap_info
      choice = ui.game_actions
      case
      when choice == "1"
        dealer_turn(ui.dealer.scores)
      when choice == "2"
        ui.player.add_card(deck.cards.sample)
        ui.player.count_scores(ui.player.cards_deck.last)
        dealer_turn(ui.dealer.scores)
      when choice == "3"
        ui.show_cards
      else
        break
      end
      ui.laps += 1
      ui.lap_result(game_result)
      ui.final_result
      start if ui.start == 1
      break if ui.laps == "n"
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
      ui.dealer.add_card(deck.cards.sample)
      ui.dealer.count_scores(ui.player.cards_deck.last)
    end
  end

  def game_result
    ui.show_cards
    if ui.player.scores > ui.dealer.scores && ui.player.scores <= 21 || \
       ui.player.scores < ui.dealer.scores && ui.player.scores == 21
      result = "win"
      ui.player.money.deposit += total_bet
    elsif ui.player.scores == ui.dealer.scores && ui.player.scores <= 21
      result = "draw"
      ui.player.money.deposit += 10
      ui.dealer.money.deposit += 10
    else
      result = "lose"
      ui.dealer.money.deposit += total_bet
    end
    ui.player.cards_deck = deck.cards.sample(2)
    ui.dealer.cards_deck = deck.cards.sample(2)
    ui.player.scores = 0
    ui.player.scores = ui.player.count_scores(ui.player.cards_deck)
    ui.dealer.scores = 0
    ui.dealer.scores = ui.dealer.count_scores(ui.dealer.cards_deck)
    ui.laps = 0
    result
  end
end
