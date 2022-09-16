```
import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="geolocation"
export default class extends Controller {
  connect() {
    console.log("not sure")
    window.navigator.geolocation.getCurrentPosition((position) => {
      console.log(position);
      const lat = position.coords.latitude;
      const lng = position.coords.longitude;
      const csrfToken = document.querySelector("[name='csrf-token']").content;
      console.log(csrfToken);

      const params = {
        coords: {
          lat: lat,
          lng: lng
        }
      }

    fetch(`/geolocate`,
      {
        method: 'POST',
        headers: { "Accept": "application/json", "X-CSRF-Token": csrfToken, "Content-Type": "application/json"},
        body: JSON.stringify(params)
      })
    })
  }
}

 def geolocate
    lat = params[:coords][:lat]
    lng = params[:coords][:lng]
    session[:lat] = lat
    session[:lng] = lng
  end
  
  def create
    @lat = session[:lat]
    @lng = session[:lng]
    @restaurant = Restaurant.new(restaurant_params)
    key = ENV['GOOGLE_MAPS_API_KEY']
    id_url = URI("https://maps.googleapis.com/maps/api/place/findplacefromtext/json?input=#{@restaurant.name}&inputtype=textquery&locationbias=point:#{@lat}%2C#{@lng}&fields=place_id&key=#{key}")
```
