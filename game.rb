class Game

  attr_reader :player, :dealer

  def start
    loop do
      p "Your cards!"
      player.start_card_deck
    end
  end

  def create_players
    p "Hello there! What is your name ?"
    name = gets.chomp!
    p "How much money do u have?"
    start_money = gets.chomp!
    @player = Player.new(name, start_money)
    @dealer = Diller.new
    @scores = Scores.new(player.start_cards_deck, dealer.start_cards_deck)
    @bank = Bank.new
    p "Lets dance!"
  end

  def game_actions

  end


end