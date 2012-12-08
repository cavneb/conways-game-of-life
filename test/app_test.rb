require 'micro_test'
require File.expand_path("../../app.rb", __FILE__)

class AppTest < MicroTest::Test

  test "cell exists" do
    assert Cell
  end

  test "board exists" do
    assert Board
  end

  test "board has cells" do
    b = Board.new
    assert b.cells
  end

  test "cell has coords" do
    c = Cell.new(1,2)
    assert c.x == 1
  end
  end

end
