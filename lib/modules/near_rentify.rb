module NearRentify
  LAT_FOR_RENTIFY = 51.526417
  LNG_FOR_RENTIFY = -0.078261

  def is_within_5_miles(postcode)
    response = RestClient.get "http://uk-postcodes.com/postcode/#{postcode}.json"
    geo_info = JSON.parse(response.body)
    lat = geo_info['geo']['lat'].to_f
    lng = geo_info['geo']['lng'].to_f
    distance = Haversine.distance(LAT_FOR_RENTIFY, LNG_FOR_RENTIFY, lat, lng).to_mi
    distance < 5.0
  end 
end
