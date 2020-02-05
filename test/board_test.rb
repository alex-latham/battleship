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
end
