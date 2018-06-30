class Player
  include CardDeck

  attr_reader :start_cards_deck

  def initialize(player_name, player_money)
    @player_name = player_name
    @player_money = player_money
    @start_cards_deck = start_cards
  end

  def add_player_card
    start_cards_deck << CARD_DECK.sample
  end

end