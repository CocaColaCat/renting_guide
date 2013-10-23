module NearRentify
  LAT_FOR_RENTIFY = 51.526417
  LNG_FOR_RENTIFY = -0.078261

  def is_within_5_miles(postcode)
  	coodinates = get_coordinates remove_spaces(postcode)
    distance = Haversine.distance(LAT_FOR_RENTIFY, LNG_FOR_RENTIFY, coodinates[:lat], coodinates[:lng]).to_mi
    distance <= 5.0
  end

  def remove_spaces(s)
    s.gsub(/\s+/, "")
  end
  
  def get_coordinates(postcode)
  	response = RestClient.get "http://uk-postcodes.com/postcode/#{remove_spaces(postcode)}.json"
    geo_info = JSON.parse(response.body)
    lat = geo_info['geo']['lat'].to_f
    lng = geo_info['geo']['lng'].to_f
    { lat: lat, lng: lng}
  end
  
  def create_link(coordinates)
  	"http://maps.googleapis.com/maps/api/staticmap?zoom=15&size=450x800&maptype=roadmap&markers=color:orange%7Clabel:R%7C51.526417,-0.078261&markers=color:blue%7Clabel:U%7C#{coordinates[:lat]},#{coordinates[:lng]}&sensor=false"
  end
end
