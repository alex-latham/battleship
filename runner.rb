require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/game'

boards = [Board.new, Board.new]
ships = [Ship.new("Cruiser", 3),
  Ship.new("Submarine", 2),
  Ship.new("Cruiser", 3),
  Ship.new("Submarine", 2)]

game = Game.new(boards, ships)
game.start
