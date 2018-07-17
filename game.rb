class Game
  include Validation

  validate :total_bet, :type, Integer

  attr_accessor :total_bet, :ui

  def initialize(name)
    @ui = UserInterface.new(name)
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
        dealer_turn(ui.dealer.hand.scores)
      when choice == "2"
        ui.player.add_card(ui.deck.cards.sample)
        ui.player.hand.count_scores(ui.player.cards_deck.last)
        dealer_turn(ui.dealer.hand.scores)
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
      ui.dealer.add_card(ui.deck.cards.sample)
      ui.dealer.hand.count_scores(ui.player.cards_deck.last)
    end
  end

  def game_result
    ui.show_cards
    if ui.player.hand.scores > ui.dealer.hand.scores && ui.player.hand.scores <= 21 || \
       ui.player.hand.scores < ui.dealer.hand.scores && ui.player.hand.scores == 21
      result = "win"
      ui.player.money.deposit += total_bet
    elsif ui.player.hand.scores == ui.dealer.hand.scores && ui.player.hand.scores <= 21
      result = "draw"
      ui.player.money.deposit += 10
      ui.dealer.money.deposit += 10
    else
      result = "lose"
      ui.dealer.money.deposit += total_bet
    end
    ui.player.cards_deck = ui.deck.cards.sample(2)
    ui.dealer.cards_deck = ui.deck.cards.sample(2)
    ui.player.hand = Hand.new(ui.player.cards_deck)
    ui.dealer.hand = Hand.new(ui.dealer.cards_deck)
    ui.laps = 0
    result
  end
end
