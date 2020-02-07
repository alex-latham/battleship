require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/game'

class GameTest < Minitest::Test

  def setup
    @boards = [Board.new, Board.new]
    @ships = [Ship.new("Cruiser", 3),
      Ship.new("Submarine", 2),
      Ship.new("Cruiser", 3),
      Ship.new("Submarine", 2)]
  end
  
  def test_it_can_exist
    game = Game.new(@boards, @ships)

    assert_instance_of Game, game
  end
end
