### routes
```ruby
# no nesting
post "upload", to: "messages#upload", as: upload
```

### HTML
```html.erb
# messages/new
<input type="file" id="image-upload" />

<button id="upload-button">Upload Image</button>

<div id="media-preview"></div>
```

### rails controller
```ruby
def upload
  # puts params.inspect

  if params[:file].content_type.start_with?("image")
    # Upload image to Cloudinary
    result = Cloudinary::Uploader.upload(params[:file])
    # Get the secure URL of the uploaded image
    file_url = result["secure_url"]
  elsif params[:file].content_type.start_with?("video")
    result = Cloudinary::Uploader.upload_large(params[:file], resource_type: :video)
    file_url = result["secure_url"]
  else
    # Unsupported file type
    render json: {error: "Unsupported file type"}, status: 400
  end

  # Respond with the image URL as JSON
  respond_to do |format|
    format.html
    format.json { render json: {file_url: file_url} }
  end
rescue => error
  # Log the error and respond with an error message
  Rails.logger.error("Error uploading image to Cloudinary: #{error.message}")
  render json: {error: "Unable to upload image"}, status: 500
end
```

### cloudinary.js
```js
const cloudinary = () => {
  const imageUpload = document.getElementById("image-upload");
  const uploadButton = document.getElementById("upload-button");
  const mediaPreview = document.getElementById("media-preview");

  uploadButton.addEventListener("click", function() {
    const file = imageUpload.files[0];
    const formData = new FormData();
    formData.append('file', file, encodeURIComponent(file.name));
    // console.log(formData.get("image"))

    const reader = new FileReader();
    let isImage = true;
    reader.readAsDataURL(file);
    reader.onload = function() {
      if (reader.result.startsWith("data:video")) {
        isImage = false;
      }
    }

    fetch(`/upload`, {
      method: "POST",
      headers: {
        "X-CSRF-Token": document.querySelector('meta[name="csrf-token"]').getAttribute('content'),
        // why not to include content type!, see: https://stackoverflow.com/questions/40685120/invalid-request-parameters-invalid-encoding-when-upload-file-to-rails-api-onl
        // "Content-Type": "multipart/form-data",
        "Accept": "application/json"
      },
      body: formData
    })
      .then(response => response.json())
      .then(data => {
        const fileUrl = data.file_url;

        if (isImage) {
          const imageElement = document.createElement("img");
          imageElement.src = fileUrl;
          mediaPreview.appendChild(imageElement);
        } else {
          const videoElement = document.createElement("video");
          videoElement.src = fileUrl;
          videoElement.controls = true;
          mediaPreview.appendChild(videoElement);
        }

      })
      .catch(error => {
        console.error("Error:", error);
      });
  });
}

export { cloudinary }

```
### application.js
```js
import "@hotwired/turbo-rails"
import "./controllers"
import "bootstrap"

import { addMail }  from './messages.js'
import { fireHower  }  from './firefly_hover.js'
import { dateToAll } from './date_to_all.js'
import { cloudinary } from './cloudinary.js'

document.addEventListener('turbo:load', () => {
  addMail()
  fireHower()
  dateToAll()
  cloudinary()
});
```

<!-- 
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
``` -->
