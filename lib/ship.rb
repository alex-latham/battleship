class Ship
  attr_reader :name

  def initialize(name_parameter, length_parameter)
    @name = name_parameter
    @length = length_parameter
  end
end
