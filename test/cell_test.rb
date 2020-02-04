require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'

class CellTest < Minitest::Test
  def test_it_can_exist
    cell = Cell.new("B4")

    assert_instance_of Cell, cell
  end

end
