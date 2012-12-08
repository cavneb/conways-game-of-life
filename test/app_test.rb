require 'micro_test'
require File.expand_path("../../app.rb", __FILE__)

class AppTest < MicroTest::Test

  test "board exists" do
    assert Board
  end

  test "board has cells" do
    b = Board.new
    assert b.cells
  end

  test "board has map of cells" do
    b = Board.new
    b.add_cell(0, 0, true)
    assert b.cells[0][0] == true
  end

  test "returns 2 live neighbors" do
    b = Board.new
    b.add_cell(0, -1, true)
    b.add_cell(0, 0, true)
    b.add_cell(0, 1, true)
    assert b.nc(0,0) == 2
  end

end
