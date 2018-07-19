class Game
  include Validation

  validate :total_bet, :type, Integer
  validate :player, :type, Player
  validate :dealer, :type, Dealer
  validate :ui, :type, UserInterface
  validate :player, :presence
  validate :dealer, :presence
  validate :ui, :presence

  attr_accessor :total_bet, :ui
  attr_reader :deck, :player, :dealer

  def initialize(name)
    @deck = Deck.new
    @player = Player.new(deck.cards.sample(2), name)
    @dealer = Dealer.new(deck.cards.sample(2))
    @ui = UserInterface.new
    @total_bet = 0
    validate!
  rescue RuntimeError => e
    p e.inspect
  end

  def start
    loop do
      bet if ui.laps.zero?
      ui.start_lap_info(player, dealer)
      choice = ui.game_actions(player)
      case
      when choice == "1"
        dealer_turn(dealer.scores)
      when choice == "2"
        player.add_card(deck.cards.sample)
        player.count_scores(player.cards_deck.last)
        dealer_turn(dealer.scores)
      when choice == "3"
        ui.show_cards(player, dealer)
      else
        break
      end
      ui.laps += 1
      ui.lap_result(game_result)
      ui.final_result(player, dealer)
      start if ui.start == 1
      break if ui.laps == "n"
    end
  end

  private

  def bet
    self.total_bet = 20
    player.money.deposit -= 10
    dealer.money.deposit -= 10
  end

  def dealer_turn(scores)
    if scores < 17
      dealer.add_card(deck.cards.sample)
      dealer.count_scores(player.cards_deck.last)
    end
  end

  def game_result
    ui.show_cards(player, dealer)
    if player.scores > dealer.scores && player.scores <= 21 || \
       player.scores < dealer.scores && player.scores == 21
      result = "win"
      player.money.deposit += total_bet
    elsif player.scores == dealer.scores && player.scores <= 21
      result = "draw"
      player.money.deposit += 10
      dealer.money.deposit += 10
    else
      result = "lose"
      dealer.money.deposit += total_bet
    end
    player.cards_deck = deck.cards.sample(2)
    dealer.cards_deck = deck.cards.sample(2)
    player.scores = 0
    player.scores = player.count_scores(player.cards_deck)
    dealer.scores = 0
    dealer.scores = dealer.count_scores(dealer.cards_deck)
    ui.laps = 0
    result
  end
end
