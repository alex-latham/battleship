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

  def test_computer_can_choose_valid_placement
    game = Game.new(@boards, @ships)
    game.place_computer_ship(@ships[0])
    occupied_cells = @boards[0].cells.values.count{ |cell| cell.ship != nil}

    assert_equal 3, occupied_cells

    game.place_computer_ship(@ships[1])
    occupied_cells = @boards[0].cells.values.count{ |cell| cell.ship != nil}
    assert_equal 5, occupied_cells
  end

end
