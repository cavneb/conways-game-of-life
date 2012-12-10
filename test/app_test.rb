require 'micro_test'
require File.expand_path("../../app.rb", __FILE__)

class AppTest < MicroTest::Test

  before :each do
    @b = Board.new
    @b.add_cell(0, -1, true)
    @b.add_cell(0, 1, true)
    @b.add_cell(0, 0, true)
  end

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

  test "neighbor count" do
    assert @b.neighbor_count(0, 0) == 2
  end

  test "cell should die" do
    @b.add_cell(9, 0, true)
    assert @b.should_die(9, 0)
  end

  test "render" do
    @b.render
  end

end
