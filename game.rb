class Game

  attr_accessor :total_bet, :round
  attr_reader :player, :dealer

  def initialize
    create_players
    @total_bet = 0
  end

  def start
    loop do
      p "Your cards!"
      self.player.cards_deck.each { |card| p " #{card} " }
      p "Dealer cards : * *"
      p "Your total scores : #{self.player.scores.scores}"
      self.total_bet += 20

      choice = game_actions
      case
      when choice == "1"
      p '1'
      when choice == "2"
      player.add_card
      player.scores.add_scores(player.cards_deck.last)
      show_cards
      when choice == "3"
      show_cards
      else
        break
      end
    end
  end

  def create_players
    p "Hello there! What is your name ?"
    name = gets.chomp!
    @player = Player.new(Bank.new, name)
    @dealer = Dealer.new(Bank.new)
    p "Lets dance!"
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
end
