require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'

class CellTest < Minitest::Test
  def test_it_can_exist
    cell = Cell.new("B4")

    assert_instance_of Cell, cell
  end

  def test_it_has_a_coordinate
    cell = Cell.new("B4")

    assert_equal "B4", cell.coordinate
  end

  def test_if_ship_on_cell
    cell = Cell.new("B4")

    assert_nil cell.ship
  end

  def test_if_cell_is_empty
    cell = Cell.new("B4")

    assert_equal true, cell.empty?
  end
end
