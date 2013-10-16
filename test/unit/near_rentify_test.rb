require "test/unit"

class TestDummy
  include NearRentify
end

class NearRentifyTest < ActionController::TestCase
  test "#is_within_5_miles should be true when given a postcode is within 5 miles" do
    assert TestDummy.new.is_within_5_miles 'EC1V9DR'
  end
  test "#is_within_5_miles should be false when given a postcode is outside 5 miles" do
    refute TestDummy.new.is_within_5_miles 'sg13qf'
  end

  test "#remove_spaces shoud remove spaces" do
    assert_equal 'aaaaa', TestDummy.new.remove_spaces('aaa aa')
  end
end
