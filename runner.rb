require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/game'

computer_data = {
  "computer_board" => Board.new,
  "cruiser" => Ship.new("Cruiser", 3),
  "submarine" => Ship.new("Submarine", 2)
}

player_data = {
  "player_board" => Board.new,
  "cruiser" => Ship.new("Cruiser", 3),
  "submarine" => Ship.new("Submarine", 2)
}

game = Game.new(computer_data, player_data)
game.main_menu
