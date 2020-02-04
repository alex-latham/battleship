class Cell
  attr_reader :coordinate

  def initialize(coordinate_parameter)
    @coordinate = coordinate_parameter
  end

  def ship
  end

  def empty?
    ship == nil ? true : false
  end
end
