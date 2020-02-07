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

  def setup
    require "pry"; binding.pry

    # set up cruiser
    random_coordinate = @computer_board.cells.keys.sample
    # @computer_board.cells[random_coordinate].
  end

end
