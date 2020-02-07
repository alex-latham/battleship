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

    return abort("Fine, byeeeeeee.") if response == "q"
    return play_game if response == "p"
    return start
  end

  def play_game
    place_computer_ship(@computer_cruiser)
    place_computer_ship(@computer_submarine)

    puts "I have laid out my ships on the grid."
    puts "You now need to lay out your two ships."
    puts "The Cruiser is three units long and the Submarine is two units long."
    puts @player_board.render(true)

    puts "Enter the squares for the Cruiser (3 spaces):"
    response = gets.chomp.upcase.split(" ")

    until @player_board.place(@player_cruiser, response) != nil do
      puts "Those are invalid coordinates. Please try again:"
      response = gets.chomp.upcase.split(" ")
    end
    puts @player_board.render(true)

    puts "Enter the squares for the Submarine (2 spaces):"
    response = gets.chomp.upcase.split(" ")

    until @player_board.place(@player_submarine, response) != nil do
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

end
