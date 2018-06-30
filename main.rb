require_relative 'card_deck'
require_relative 'player'
require_relative 'diller'
require_relative 'bank'
require_relative 'scores'
require_relative 'game'

p 'Welcome to Black_Jack'

@game = Game.new
@game.start

