require "test/unit"

class TestDummy
  include NearRentify
end

class NearRentifyTest < ActionController::TestCase

  test "should get true when given EC1V 9DR" do
    assert TestDummy.new.is_within_5_miles 'EC1V9DR'
  end
end
