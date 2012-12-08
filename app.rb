class Board
  attr_accessor :cells

  def initialize
    @cells = {}
  end

  def add_cell(x, y, living)
    if @cells.keys.include? x
      @cells[x][y] = living
    else
      @cells[x] = {}
      @cells[x][y] = living
    end
  end

  def get_status(x,y)
    @cells[x][y]
  end

  def nc(x,y)
    #((x-1)..(x+1)).each do |a|
    #  ((y-1)..(y+1)).each do |b|
    2
  end
  
end
