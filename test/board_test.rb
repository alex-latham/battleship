require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'
require './lib/board'

class BoardTest < Minitest::Test

  def setup
    @board = Board.new
    @board.generate_cells(4)
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
  end

  def test_it_can_exist
    assert_instance_of Board, @board
  end

  def test_it_has_cells
    assert_equal Hash, @board.cells.class
    assert_equal 16, @board.cells.length
    assert_instance_of Cell, @board.cells["C3"]
  end

  def test_if_coordinate_is_valid
    assert_equal true, @board.valid_coordinate?("A1")
    assert_equal true, @board.valid_coordinate?("D4")
    assert_equal false, @board.valid_coordinate?("A5")
    assert_equal false, @board.valid_coordinate?("E1")
    assert_equal false, @board.valid_coordinate?("A22")
  end

  def test_it_can_check_coordinates_length_against_ship_length
    assert_equal false, @board.valid_placement?(@cruiser, ["A1", "A2"])
    assert_equal false, @board.valid_placement?(@submarine, ["A2", "A3", "A4"])
  end

  def it_can_check_coordinates_are_consecutive
    assert_equal false, @board.valid_placement?(@cruiser, ["A1", "A2", "A4"])
    assert_equal false, @board.valid_placement?(@submarine, ["A1", "C1"])
    assert_equal false, @board.valid_placement?(@cruiser, ["A3", "A2", "A1"])
    assert_equal false, @board.valid_placement?(@submarine, ["C1", "B1"])
  end

  def it_can_check_for_diagonal_coordinates
    assert_equal false, @board.valid_placement?(@cruiser, ["A1", "B2", "C3"])
    assert_equal false, @board.valid_placement?(@submarine, ["C2", "D3"])
  end

  def it_can_validate_acceptable_coordinates
    assert_equal true, @board.valid_placement?(@submarine, ["A1", "A2"])
    assert_equal true, @board.valid_placement?(@cruiser, ["B1", "C1", "D1"])
  end

  def test_if_can_place_ship
    @board.place(@cruiser, ["A1", "A2", "A3"])
    cell_1 = @board.cells["A1"]
    cell_2 = @board.cells["A2"]
    cell_3 = @board.cells["A3"]

    assert_equal @cruiser, cell_1.ship
    assert_equal @cruiser, cell_2.ship
    assert_equal @cruiser, cell_3.ship
    assert_equal cell_3.ship, cell_2.ship
  end

  def test_ships_cannot_overlap
    @board.place(@cruiser, ["A1", "A2", "A3"])

    assert_equal false, @board.valid_placement?(@submarine, ["A1", "B1"])
  end

  def test_board_can_render
    @board.place(@cruiser, ["A1", "A2", "A3"])
    render_false = "  1 2 3 4 \nA . . . . \nB . . . . \nC . . . . \nD . . . . \n"
    render_true = "  1 2 3 4 \nA S S S . \nB . . . . \nC . . . . \nD . . . . \n"

    assert_equal render_false, @board.render
    assert_equal render_true, @board.render(true)
  end

  def test_it_cannot_fire_on_same_coordinate_twice
    assert_equal true, @board.valid_target?("A1")

    @board.cells["A1"].fire_upon

    assert_equal false, @board.valid_target?("A1")
  end

  def test_if_coordinates_are_valid
    assert_equal true, @board.valid_coordinates?(["A1", "A2", "A3"])
    assert_equal false, @board.valid_coordinates?(["A1", "A2", "A5"])
  end

  def test_if_target_coordinates_are_empty
    assert_equal true, @board.target_coordinates_empty?(["A1", "A2", "A3"])

    @board.place(@cruiser, ["A1", "A2", "A3"])

    assert_equal false, @board.target_coordinates_empty?(["A1", "A2", "A3"])
  end

end
