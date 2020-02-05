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
end
