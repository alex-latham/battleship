class Game

  def initialize(boards_parameter, ships_parameter)
    @computer_board = boards_parameter[0]
    @player_board = boards_parameter[1]
    @computer_cruiser = ships_parameter[0]
    @computer_submarine = ships_parameter[1]
    @player_cruiser = ships_parameter[2]
    @player_submarine = ships_parameter[3]
  end

  def main_menu
    puts "Welcome to BATTLESHIP"
    puts "Enter p to play. Enter q to quit."

    response = gets.chomp.downcase

    return abort("Fine, byeeeeeee.") if response == "q"
    return setup if response == "p"
    return main_menu
  end

  def setup
    place_computer_ship(@computer_cruiser)
    place_computer_ship(@computer_submarine)

    puts "I have laid out my ships on the grid."
    puts "You now need to lay out your two ships."
    puts "The Cruiser is three units long and the Submarine is two units long."

    puts @player_board.render(true)
    place_player_ship(@player_cruiser)
    place_player_ship(@player_submarine)

    turn
  end

  def turn
    display_boards
    player_shot
  end

  def place_player_ship(ship_parameter)
    puts "Enter the squares for the #{ship_parameter.name} (#{ship_parameter.length} spaces):"
    response = gets.chomp.upcase.split(" ")
    until @player_board.place(ship_parameter, response) != nil do
      puts "Those are invalid coordinates. Please try again:"
      response = gets.chomp.upcase.split(" ")
    end
    puts @player_board.render(true)
  end

  def place_computer_ship(ship_parameter)
      ship_coordinates = nil
      until  ship_coordinates != nil do
        random_coordinates = @computer_board.cells.keys.sample(ship_parameter.length)
        ship_coordinates = @computer_board.place(ship_parameter, random_coordinates)
      end
  end
# remove true argument for computer board when finished debugging
  def display_boards
    puts "=============COMPUTER BOARD============="
    puts @computer_board.render(true)
    puts "=============PLAYER BOARD==============="
    puts @player_board.render(true)
  end

  def player_shot
    puts "Enter the coordinate for your shot:"
    response = gets.chomp.upcase

    until @computer_board.valid_target?(response)
      puts "Please enter a valid coordinate:"
      response = gets.chomp.upcase
    end

    @computer_board.cells[response].fire_upon
    display_boards
  end

end
