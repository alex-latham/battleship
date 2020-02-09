require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/game'

class GameTest < Minitest::Test

  def setup
    @computer_data = {
      computer_board: Board.new,
      cruiser: Ship.new("Cruiser", 3),
      submarine: Ship.new("Submarine", 2)
    }

    @player_data = {
      player_board: Board.new,
      cruiser: Ship.new("Cruiser", 3),
      submarine: Ship.new("Submarine", 2)
    }

    @game = Game.new(@computer_data, @player_data)
  end

  def test_it_can_exist

    assert_instance_of Game, @game
  end

  def test_computer_can_choose_valid_placement
    @game.place_computer_ship(@computer_data[:cruiser])
    occupied_cells = @computer_data[:computer_board].cells.values.count{ |cell| cell.ship != nil}

    assert_equal 3, occupied_cells

    @game.place_computer_ship(@computer_data[:submarine])
    occupied_cells = @computer_data[:computer_board].cells.values.count{ |cell| cell.ship != nil}
    assert_equal 5, occupied_cells
  end

end
