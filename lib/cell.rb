class Cell
  attr_reader :coordinate,
              :ship

  def initialize(coordinate_parameter)
    @coordinate = coordinate_parameter
    @ship = nil
    @fired_upon = false
  end

  def empty?
    ship == nil ? true : false
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

  def render(show_ship = false)
    if @fired_upon == false
      if show_ship == true && @ship != nil
        "S"
      else
        "."
      end
    elsif @ship == nil
      "M"
    else
      if @ship.sunk? == true
        "X"
      else
      "H"
      end
    end
  end

end
