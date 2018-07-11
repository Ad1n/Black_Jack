require_relative 'accessors'
require_relative 'validation'
require_relative 'card'
require_relative 'deck'
require_relative 'bank'
require_relative 'scores'
require_relative 'user_interface'
require_relative 'dealer'
require_relative 'player'
require_relative 'game'

p 'Welcome to Black_Jack'

@game = Game.new
@game.start
