require 'micro_test'
require File.expand_path("../../app.rb", __FILE__)

class AppTest < MicroTest::Test

  test "cell exists" do
    assert Cell
  end

end
