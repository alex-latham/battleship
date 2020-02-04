class Cell
  attr_reader :coordinate,
              :ship

  def initialize(coordinate_parameter)
    @coordinate = coordinate_parameter
    @ship = nil
  end

  def empty?
    ship == nil ? true : false
  end

  def place_ship(ship_parameter)
    @ship = ship_parameter
  end

  def fired_upon?
    false
  end
end
