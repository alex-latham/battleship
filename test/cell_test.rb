require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'

class CellTest < Minitest::Test

  def setup
    @cell = Cell.new("B4")
    @cell_1 = Cell.new("B4")
    @cell_2 = Cell.new("D4")
    @cruiser = Ship.new("Cruiser", 3)
  end

  def test_it_can_exist
    assert_instance_of Cell, @cell
  end

  def test_it_has_a_coordinate
    assert_equal "B4", @cell.coordinate
  end

  def test_if_it_is_empty
    assert_nil @cell.ship
    assert_equal true, @cell.empty?

    @cell.place_ship(@cruiser)

    assert_equal @cruiser, @cell.ship
    assert_equal false, @cell.empty?
  end

  def test_if_fired_upon
    @cell.place_ship(@cruiser)

    assert_equal false, @cell.fired_upon?

    @cell.fire_upon

    assert_equal 2, @cell.ship.health
    assert_equal true, @cell.fired_upon?
  end

  def test_it_can_render
    assert_equal ".", @cell_1.render

    @cell_1.fire_upon

    assert_equal "M", @cell_1.render

    @cell_2.place_ship(@cruiser)

    assert_equal ".", @cell_2.render
    assert_equal "S", @cell_2.render(true)

    @cell_2.fire_upon

    assert_equal "H", @cell_2.render
    assert_equal false, @cruiser.sunk?

    @cruiser.hit
    @cruiser.hit

    assert_equal true, @cruiser.sunk?
    assert_equal "X", @cell_2.render
  end

end
