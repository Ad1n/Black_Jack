class Player
  include CardDeck

  attr_reader :start_cards_deck

  def initialize(player_name, cash)
    @player_name = player_name
    @start_cards_deck = start_cards
  end
end