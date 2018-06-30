class Game

  attr_reader :player, :dealer, :scores

  def start
    create_players
    loop do
      p "Your cards!"
      self.player.start_cards_deck.each { |card| p " #{card} " }
      p "Dealer cards : * *"
      p "Your total scores : #{self.scores.player_total_scores}"
      case
      when game_actions == "1"
      p '1'
      when game_actions == "2"
      p '2'
      when game_actions == "3"
      p '3'
      else
        break
      end
    end
  end

  def create_players
    p "Hello there! What is your name ?"
    name = gets.chomp!
    p "How much money do u have?"
    start_money = gets.chomp!
    @player = Player.new(name, start_money)
    @dealer = Diller.new(100)
    @scores = Scores.new(player.start_cards_deck, dealer.start_cards_deck)
    @bank = Bank.new
    p "Lets dance!"
  end

  def game_actions
    p "Enter number of your action"
    p "1 - SKIP"
    p "2 - TAKE CARD"
    p "3 - SHOW CARDS"
    gets.chomp!
  end


end