```
  if params[:query].present?
    # search
  else
    @restaurants = Restaurant.all
  end
  
```

#### AJAX:

```js
// search stimulus controller
static targets = ["restaurants"];

async search() {
  const query = this.element.value;

  const response = await fetch(`/restaurants?query=${query}`);
  const html = await response.text();

  this.resultsTarget.innerHTML = html;
}
```

```ruby
# restaurant controller
def index
  respond_to do |format|
    format.html
    format.json { render json: @restaurants }
  end
 end
```

```html.erb
<!-- index.html.erb -->
<div data-controller="search">
  <div data-search-target="restaurants">
    <% @restaurants.each do |restaurant| %>
      <div class="restaurant">
        <h2><%= restaurant.name %></h2>
        <p><%= restaurant.description %></p>
      </div>
    <% end %>
  </div>
</div>
```
