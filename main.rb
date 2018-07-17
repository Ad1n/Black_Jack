require_relative 'accessors'
require_relative 'validation'
require_relative 'card'
require_relative 'deck'
require_relative 'bank'
require_relative 'user_interface'
require_relative 'dealer'
require_relative 'player'
require_relative 'game'

p 'Welcome to Black_Jack'
p "Hello there! What is your name ?"
name = gets.chomp!
while name == ""
  p "Type name please..."
  name = gets.chomp!
end
p "Lets dance #{name} !"
@game = Game.new(name)
@game.start


