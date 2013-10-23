require "test/unit"

class TestDummy
  include NearRentify
end

class NearRentifyTest < ActionController::TestCase
  
  test "#is_within_5_miles should be true when given a postcode(with or without space) is within 5 miles" do
    assert TestDummy.new.is_within_5_miles 'EC1V9DR'
    assert TestDummy.new.is_within_5_miles 'EC1 V9DR'
  end
  
  test "#is_within_5_miles should be false when given a postcode(with or without space) is outside 5 miles" do
    refute TestDummy.new.is_within_5_miles 'sg13qf'
    refute TestDummy.new.is_within_5_miles 'sg1 3qf'
  end

  test "#remove_spaces shoud remove spaces" do
    assert_equal 'aaaaa', TestDummy.new.remove_spaces('aaa aa')
  end
  
  test "#get_coordinates should get coordinates" do
  	expected_one = { lat: 51.526600, lng: -0.081598}
  	expected_two = { lat: 51.912781, lng: -0.205286}
  	assert_equal expected_one, TestDummy.new.get_coordinates('EC1 V9DR')
  	assert_equal expected_two, TestDummy.new.get_coordinates('sg13qf')
  end
  
  test "#create_link should create link to static google map" do
  	any_lat = 12345
  	any_lng = 67890
  	coordinates = { lat: any_lat, lng: any_lng}
  	expected = "http://maps.googleapis.com/maps/api/staticmap?zoom=15&size=500x500&maptype=roadmap&markers=color:orange%7Clabel:R%7C51.526417,-0.078261&markers=color:blue%7Clabel:U%7C#{any_lat},#{any_lng}&sensor=false"
  	
  	assert_equal expected, TestDummy.new.create_link(coordinates)
  end
end
