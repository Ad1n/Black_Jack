class UserInterface

  attr_accessor :laps, :start

  def initialize
    @laps = 0
    @start = 0
  end

  def start_lap_info(player, dealer)
    p "Your cards!"
    player.cards_deck.each { |card| p " #{card} " }
    p "Dealer cards : "
    dealer.cards_deck.each { p "* " }
    p "Your total scores : #{player.scores}"
    p "Your money bank: #{player.money.deposit}"
  end

  def game_actions(player)
    p "Enter number of your action"
    p "1 - SKIP"
    p "2 - TAKE CARD" if player.cards_deck.count < 3
    p "3 - SHOW CARDS"
    gets.chomp!
  end

  def show_cards(player, dealer)
    p "Player cards : #{player.cards_deck.map(&:to_s)}"
    p "Dealer cards : #{dealer.cards_deck.map(&:to_s)}"
  end

  def choice(choice, player, dealer)
    if choice == "y"
      player.money = Bank.new
      dealer.money = Bank.new
      self.start = 1
    else
      p "Thanks for gaming! Bye..."
      self.laps = "n"
    end
  end

  def final_result(player, dealer)
    if dealer.money.deposit == 0
      p "Congratulations! You win the game! Continue? y / n"
      choice = gets.chomp!
      choice(choice, player, dealer)
    elsif player.money.deposit == 0
      p "You lose... Another try ?  y / n"
      choice = gets.chomp!
      choice(choice, player, dealer)
    end
  end

  def lap_result(result)
    if result == "win"
      p "You win!"
      p "_____________________"
    elsif result == "draw"
      p "Draw!"
      p "_____________________"
    else
      p "You lose..."
      p "_____________________"
    end
  end
end
