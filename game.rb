class Game

  attr_accessor :total_bet, :laps
  attr_reader :player, :dealer

  def initialize
    create_players
    @total_bet = 0
  end

  def start
    self.laps = 0
    loop do
      p "Your cards!"
      player.cards_deck.each { |card| p " #{card} " }
      p "Dealer cards : "
      dealer.cards_deck.each { p "* " }
      p "Your total scores : #{player.scores.scores}"
      bet if laps == 0
      p "Your money bank: #{player.money.deposit}"

      choice = game_actions
      case
      when choice == "1"
        dealer_turn(dealer.scores.scores)
      when choice == "2"
        player.add_card
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

  def create_players
    p "Hello there! What is your name ?"
    name = gets.chomp!
    @player = Player.new(Bank.new, name)
    @dealer = Dealer.new(Bank.new)
    p "Lets dance #{name} !"
  end

  def game_actions
    p "Enter number of your action"
    p "1 - SKIP"
    p "2 - TAKE CARD" if player.cards_deck.count < 3
    p "3 - SHOW CARDS"
    gets.chomp!
  end

  def show_cards
    p "Player cards : #{player.cards_deck}"
    p "Dealer cards : #{dealer.cards_deck}"
  end

  def dealer_turn(scores)
    if scores < 17
      dealer.add_card
      dealer.scores.count_scores(player.cards_deck.last)
    end
  end

  def bet
    self.total_bet = 20
    player.money.deposit -= 10
    dealer.money.deposit -= 10
  end

  def game_result
    show_cards
    if player.scores.scores > dealer.scores.scores && player.scores.scores <= 21 || \
       player.scores.scores < dealer.scores.scores && player.scores.scores == 21
      p "You win!"
      p "_____________________"
      player.money.deposit += total_bet
    elsif player.scores.scores == dealer.scores.scores && player.scores.scores <= 21
      p "Draw!"
      p "_____________________"
      player.money.deposit += 10
      dealer.money.deposit += 10
    else
      p "You lose..."
      p "_____________________"
      dealer.money.deposit += total_bet
    end
    player.cards_deck = player.start_cards
    dealer.cards_deck = dealer.start_cards
    player.scores = Scores.new(player.cards_deck)
    dealer.scores = Scores.new(dealer.cards_deck)
    self.laps = 0
  end

  def choice(choice)
    if choice == "y"
      player.money = Bank.new
      dealer.money = Bank.new
      start
    else
      p "Thanks for gaming! Bye..."
      self.laps = "exit"
    end
  end

  def final_result
    if dealer.money.deposit == 80
      p "Congratulations! You win the game! Continue? y / n"
      choice = gets.chomp!
      choice(choice)
    elsif player.money.deposit == 0
      p "You lose... Another try ?  y / n"
      choice = gets.chomp!
      choice(choice)
    end
  end
end
