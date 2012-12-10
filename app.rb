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
    @cells[x][y] rescue nil
  end

  def neighbor_count(x, y)
    c = 0
    ((x-1)..(x+1)).each do |a|
      ((y-1)..(y+1)).each do |b|
        next if x == a && b == y
        c += 1 if get_status(a, b) == true
      end
    end
    c
  end

  def should_die(x, y)
    c = neighbor_count(x, y)
    if c < 2 || c > 3
      true
    else
      false
    end
  end

  def should_regen(x, y)
  end

  def tick
    temp = @cells.clone
    @cells.each do |x,yhash|
      yhash.each do |y, state|
        if should_die(x,y) && state == true
          temp[x][y] = false
        elsif !should_die(x,y) && state == false
          temp[x][y] = true
        else
          temp[x][y] = state
        end
      end
    end
    @cells = temp
  end

  def render
    cols = []
    (-35..35).each do |y|
      row = []
      (-200..200).each do |x|
        s = get_status(x,y)
        if s == true
          row << "X"
        elsif s == false
          row << " "
        else
          row << " "
        end
      end
      cols << row
    end
    cols
  end
  
end

b = Board.new

(-200..200).each do |x|
  (-35..35).each do |y|
    if (rand(100) == 1) {
      # b.add_cell(x, y, (rand(100) == 1))  
      b.add_cell(x, y, [true, false].sample)
    }
    
  end
end

# 500.times do |i|
loop do
  b.tick
  puts "\n\n\n\n\n\n\n\n\n\n\n\n\n"
  cols = b.render
  data = ""
  cols.each do |row|
    puts row.join
  end
  
end
