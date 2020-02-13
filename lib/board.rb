class Board
  attr_reader :cells

  def initialize
    @cells = {}
  end

  def generate_cells(size_parameter)
    size = size_parameter
    starting_ord_value = 65
    columns = (1..size).to_a
    coordinates = []
    until starting_ord_value == size + 65
      columns.each do |column|
        coordinates << starting_ord_value.chr + column.to_s
      end
      starting_ord_value += 1
    end
    cells = {}
    coordinates.each do |coordinate|
      cells[coordinate] = Cell.new(coordinate)
    end
    @cells = cells
  end

  def valid_coordinate?(coordinate_parameter)
    @cells.include?(coordinate_parameter)
  end

  def valid_placement?(ship_parameter, coordinates_parameter)
    return false if !valid_coordinates?(coordinates_parameter)
    return false if !target_coordinates_empty?(coordinates_parameter)
    return consecutive?(ship_parameter, coordinates_parameter)
  end

  def valid_coordinates?(coordinates_parameter)
    coordinates_parameter.all? { |coordinate| valid_coordinate?(coordinate) }
  end

  def target_coordinates_empty?(coordinates_parameter)
    coordinates_parameter.all? { |coordinate| @cells[coordinate].ship == nil }
  end

  def consecutive?(ship_parameter, coordinates_parameter)
    letters = coordinates_parameter.map do |coordinate|
      coordinate.match(/[A-Z]/).to_s.ord
    end.uniq.sort

    numbers = coordinates_parameter.map do |coordinate|
      coordinate.match(/[0-9]+/).to_s.to_i
    end.uniq.sort

    return true if letters.last - letters.first == ship_parameter.length - 1 && numbers.length == 1
    return true if numbers.last - numbers.first == ship_parameter.length - 1 && letters.length == 1
    return false
  end


  def place(ship_parameter, coordinates_parameter)
    if valid_placement?(ship_parameter, coordinates_parameter)
      coordinates_parameter.each do |coordinate|
        @cells[coordinate].place_ship(ship_parameter)
      end
    end
  end

  def valid_target?(coordinate_parameter)
    valid_coordinate?(coordinate_parameter) && !@cells[coordinate_parameter].fired_upon?
  end

  def render(show_ship_parameter = false)
    board = "  "
    length = Math.sqrt(@cells.length).to_i
    length.times do |index|
      board << (index + 1).to_s
      if index > 8
        board << " "
      else
        board << "  "
      end
    end
    board << "\n"

    starting_ord_value = 65
    length.times do
      board << "#{starting_ord_value.chr} "
      length.times do |column_index|
        board << "#{cells[starting_ord_value.chr + (column_index + 1).to_s].render(show_ship_parameter)}  "
      end
      board << "\n"
      starting_ord_value += 1
    end
    board
  end

end
