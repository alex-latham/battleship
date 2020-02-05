class Board

  def initialize
  end

  def cells
    hash = {}
    hash["A1"] = Cell.new("A1")
    hash["A2"] = Cell.new("A2")
    hash["A3"] = Cell.new("A3")
    hash["A4"] = Cell.new("A4")
    hash["B1"] = Cell.new("B1")
    hash["B2"] = Cell.new("B2")
    hash["B3"] = Cell.new("B3")
    hash["B4"] = Cell.new("B4")
    hash["C1"] = Cell.new("C1")
    hash["C2"] = Cell.new("C2")
    hash["C3"] = Cell.new("C3")
    hash["C4"] = Cell.new("C4")
    hash["D1"] = Cell.new("D1")
    hash["D2"] = Cell.new("D2")
    hash["D3"] = Cell.new("D3")
    hash["D4"] = Cell.new("D4")
    hash
  end
end
