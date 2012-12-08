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

  test "get status with missing keys" do
    b = Board.new
    b.add_cell(1, 0, true)
    assert !b.get_status(0, 0)
    assert b.get_status(1, 0)
  end

  test "stuff" do
    b = Board.new
    b.add_cell(0, -1, true)
    b.add_cell(0, 1, true)
    b.add_cell(0, 0, true)

    assert b.nc(0, 0) == 2
  end

end
