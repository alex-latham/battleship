class Board
  attr_reader :cells

  def initialize
    @cells = {
      "A1" => Cell.new("A1"),
      "A2" => Cell.new("A2"),
      "A3" => Cell.new("A3"),
      "A4" => Cell.new("A4"),
      "B1" => Cell.new("B1"),
      "B2" => Cell.new("B2"),
      "B3" => Cell.new("B3"),
      "B4" => Cell.new("B4"),
      "C1" => Cell.new("C1"),
      "C2" => Cell.new("C2"),
      "C3" => Cell.new("C3"),
      "C4" => Cell.new("C4"),
      "D1" => Cell.new("D1"),
      "D2" => Cell.new("D2"),
      "D3" => Cell.new("D3"),
      "D4" => Cell.new("D4")
    }
  end

  def valid_coordinate?(coordinate_parameter)
    @cells.include?(coordinate_parameter)
  end


  def valid_placement_coordinate_length?(ship_parameter, coordinates_parameter)
    coordinates_parameter.length == ship_parameter.length &&
    coordinates_parameter.all? {|coordinate| @cells[coordinate].ship == nil}
  end

  def valid_placement?(ship_parameter, coordinates_parameter)
    letters = coordinates_parameter.map {|coordinate| coordinate[0].ord }.uniq.sort!
    numbers = coordinates_parameter.map {|coordinate| coordinate[1].to_i }.uniq.sort!

    if valid_placement_coordinate_length?(ship_parameter, coordinates_parameter)
      if numbers.last - numbers.first == ship_parameter.length - 1 && letters.length == 1
        true
      elsif letters.last - letters.first == ship_parameter.length - 1 && numbers.length == 1
        true
      else
        false
      end
    else
      false
    end
  end

  def place(ship_parameter, coordinates_parameter)
    if valid_placement?(ship_parameter, coordinates_parameter)
      coordinates_parameter.each do |coordinate|
      @cells[coordinate].place_ship(ship_parameter)
      end
    end
  end
# refactor this method later
  def render(show_ship = false)
    header = "  1 2 3 4 \n"
    row_a = "A #{@cells["A1"].render(show_ship)} #{@cells["A2"].render(show_ship)} #{@cells["A3"].render(show_ship)} #{@cells["A4"].render(show_ship)} \n"
    row_b = "B #{@cells["B1"].render(show_ship)} #{@cells["B2"].render(show_ship)} #{@cells["B3"].render(show_ship)} #{@cells["B4"].render(show_ship)} \n"
    row_c = "C #{@cells["C1"].render(show_ship)} #{@cells["C2"].render(show_ship)} #{@cells["C3"].render(show_ship)} #{@cells["C4"].render(show_ship)} \n"
    row_d = "D #{@cells["D1"].render(show_ship)} #{@cells["D2"].render(show_ship)} #{@cells["D3"].render(show_ship)} #{@cells["D4"].render(show_ship)} \n"
    header + row_a + row_b + row_c + row_d
  end

end
