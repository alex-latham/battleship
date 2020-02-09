class Cell
  attr_reader :coordinate, :ship

  def initialize(coordinate_parameter)
    @coordinate = coordinate_parameter
    @ship = nil
    @fired_upon = false
  end

  def empty?
    ship == nil
  end

  def place_ship(ship_parameter)
    @ship = ship_parameter
  end

  def fired_upon?
    @fired_upon
  end

  def fire_upon
    @fired_upon = true

    if @ship != nil
      @ship.hit
    end
  end

  def render(show_ship_parameter = false)
    return "M" if @fired_upon == true && @ship == nil
    return "X" if @fired_upon == true && @ship.sunk? == true
    return "H" if @fired_upon == true && @ship != nil
    return "S" if show_ship_parameter == true && @ship != nil
    return "."
  end

end
