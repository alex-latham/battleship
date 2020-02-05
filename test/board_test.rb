require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'
require './lib/board'

class BoardTest < Minitest::Test
  def test_it_can_exist
    board = Board.new
    assert_instance_of Board, board
  end

  def test_it_has_cells
    board = Board.new
    hash = board.cells

    assert_equal Hash, hash.class
    assert_equal 16, hash.length
    assert_instance_of Cell, hash["A1"]
  end

  def test_if_coordinate_is_valid
    board = Board.new
    board.cells

    assert_equal true, board.valid_coordinate?("A1")
    assert_equal false, board.valid_coordinate?("A5")
  end

  def test_it_can_validate_placement
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    assert_equal false, board.valid_placement?(cruiser, ["A1", "A1"])
    assert_equal false, board.valid_placement?(submarine, ["A2", "A3", "A4"])
  end
end
