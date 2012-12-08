class Board
  attr_accessor :cells

  def initialize
    @cells = []
  end
  
end

class Cell
  attr_accessor :x
  def initialize(x,y)
    @x = x
  end



end
