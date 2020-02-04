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

    cruiser = Ship.new("Cruiser", 3)
    cell.place_ship(cruiser)
    assert_equal cruiser, cell.ship
  end

  def test_if_cell_is_empty
    cell = Cell.new("B4")

    assert_equal true, cell.empty?

    cruiser = Ship.new("Cruiser", 3)
    cell.place_ship(cruiser)
    assert_equal false, cell.empty?
  end

  def test_if_fired_upon
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)
    cell.place_ship(cruiser)

    assert_equal false, cell.fired_upon?
  end

end
