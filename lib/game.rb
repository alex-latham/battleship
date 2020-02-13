class Game

  def initialize(computer_data_parameter, player_data_parameter)
    @computer_data = computer_data_parameter
    @player_data = player_data_parameter
  end

  def main_menu
    puts "Welcome to BATTLESHIP"
    puts "Enter p to play. Enter q to quit."
  end

  def setup

    place_computer_ship(@computer_data[:cruiser])
    place_computer_ship(@computer_data[:submarine])

    puts "I have laid out my ships on the grid."
    puts "You now need to lay out your two ships."
    puts "The Cruiser is three units long and the Submarine is two units long."

    puts @player_data[:player_board].render(true)
    place_player_ship(@player_data[:cruiser])
    place_player_ship(@player_data[:submarine])
  end

  def turn
    until @computer_data[:cruiser].health == 0 && @computer_data[:submarine].health == 0 ||
    @player_data[:cruiser].health == 0 && @player_data[:submarine].health == 0
      display_boards
      player_shot
      computer_shot
    end
  end

  def end_game
    if @computer_data[:cruiser].health == 0 && @computer_data[:submarine].health == 0
      puts "You won!"
    else
      puts "I won!"
    end
    main_menu
  end

  def place_player_ship(ship_parameter)
    puts "Enter the squares for the #{ship_parameter.name} (#{ship_parameter.length} spaces):"
    response = gets.chomp.upcase.gsub(",", " ").split(" ")
    until @player_data[:player_board].place(ship_parameter, response) != nil do
      puts "Those are invalid coordinates. Please try again:"
      response = gets.chomp.upcase.gsub(",", " ").split(" ")
    end
    puts @player_data[:player_board].render(true)
  end

  def place_computer_ship(ship_parameter)
    ship_coordinates = nil
    until ship_coordinates != nil do
      random_coordinates = @computer_data[:computer_board].cells.keys.sample(ship_parameter.length)
      ship_coordinates = @computer_data[:computer_board].place(ship_parameter, random_coordinates)
    end
  end

  def display_boards
    computer_equal_signs = ((Math.sqrt(@computer_data[:computer_board].cells.length) * 3 - 14) / 2).to_i
    computer_equal_signs < 3 ? computer_equal_signs = 3 : computer_equal_signs
    computer_header = "=" * computer_equal_signs + "COMPUTER BOARD" + "=" * computer_equal_signs
    puts computer_header
    puts @computer_data[:computer_board].render

    player_equal_signs = ((Math.sqrt(@player_data[:player_board].cells.length) * 3 - 12) / 2).to_i
    player_equal_signs < 3 ? player_equal_signs = 3 : player_equal_signs
    player_header = "=" * player_equal_signs + "PLAYER BOARD" + "=" * player_equal_signs
    puts player_header
    puts @player_data[:player_board].render(true)
  end

  def player_shot
    puts "Enter the coordinate for your shot:"
    target_parameter = gets.chomp.upcase.delete(" ")

    until @computer_data[:computer_board].valid_target?(target_parameter)
      puts "Please enter a valid coordinate:"
      target_parameter = gets.chomp.upcase.delete(" ")
    end

    @computer_data[:computer_board].cells[target_parameter].fire_upon
    player_feedback(target_parameter)
  end

  def computer_shot
    target_parameter = @player_data[:player_board].cells.keys.sample

    until @player_data[:player_board].valid_target?(target_parameter)
      target_parameter = @player_data[:player_board].cells.keys.sample
    end

    @player_data[:player_board].cells[target_parameter].fire_upon
    computer_feedback(target_parameter)
  end

  def player_feedback(target_parameter)
    return puts "Your shot on #{target_parameter} was a miss." if @computer_data[:computer_board].cells[target_parameter].render == "M"
    return puts "Your shot on #{target_parameter} was a hit." if @computer_data[:computer_board].cells[target_parameter].render == "H"
    return puts "Your shot on #{target_parameter} sunk my #{@computer_data[:computer_board].cells[target_parameter].ship.name}."
  end

  def computer_feedback(target_parameter)
    return puts "My shot on #{target_parameter} was a miss." if @player_data[:player_board].cells[target_parameter].render == "M"
    return puts "My shot on #{target_parameter} was a hit." if @player_data[:player_board].cells[target_parameter].render == "H"
    return puts "My shot on #{target_parameter} sunk your #{@player_data[:player_board].cells[target_parameter].ship.name}."
  end
end
