class Game

  def initialize(boards_parameter, ships_parameter)
    @computer_board = boards_parameter[0]
    @player_board = boards_parameter[1]
    @computer_cruiser = ships_parameter[0]
    @computer_submarine = ships_parameter[1]
    @player_cruiser = ships_parameter[2]
    @player_submarine = ships_parameter[3]
  end

  def start
    puts "Welcome to BATTLESHIP"
    puts "Enter p to play. Enter q to quit."

    response = gets.chomp.downcase

    if response == "p"
      setup
    else
      abort("Fine, byeeeeeee.")
    end
  end

  def place_computer_ship(ship_parameter)

    # set up cruiser
      cruiser_coordinates = nil
      until  cruiser_coordinates != nil do
        random_coordinates = @computer_board.cells.keys.sample(ship_parameter.length)
        cruiser_coordinates = @computer_board.place(ship_parameter, random_coordinates)
      end
  end

end
