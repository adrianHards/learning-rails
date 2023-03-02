#### SQL, page refresh:

```ruby
def index
  start_date = params[:start_date]
  end_date = params[:end_date]

  @apartments = Apartment.where(
    "id NOT IN (
      SELECT apartment_id
      FROM bookings
      WHERE start_date <= ? AND end_date >= ?
    )",
    end_date, start_date
  )
end
```

#### pg_search, page refresh:
```ruby
# model
class Restaurant < ApplicationRecord
  include PgSearch::Model

  pg_search_scope :search_available_between, against: [], using: {
    tsearch: { any_word: true }
  }

  def self.available_between(start_date, end_date)
    where.not(
      id: Booking.where('start_date <= ? AND end_date >= ?', end_date, start_date).select(:restaurant_id)
    ).search_available_between
  end
end

# controller
def index
  if params[:query].present?
    start_date = params[:start_date]
    end_date = params[:end_date]
    @restaurants = Restautant.available_between(start_date, end_date)
  else
    @restaurants = Restaurant.all
  end
end
```


#### AJAX:

```html.erb
<input type="text" data-controller="search" data-action="input->search#search" />

<!-- index.html.erb -->
<div data-search-target="restaurants">
  <% @restaurants.each do |restaurant| %>
    <div class="restaurant">
      <h2><%= restaurant.name %></h2>
      <p><%= restaurant.description %></p>
    </div>
  <% end %>
</div>
```

```js
// search stimulus controller
static targets = ["restaurants"];

async search() {
  const query = this.element.value;

  const response = await fetch(`/restaurants?query=${query}.json`);
  const results = await response.json();
  
  const html = results.map((restaurant) => {
      return `
        <div class="restaurant">
          <h2>${restaurant.name}</h2>
          <p>${restaurant.description}</p>
        </div>
      `;
    }).join('');

  this.resultsTarget.innerHTML = html;
}
```

```ruby
# restaurant controller
def index
  if params[:query].present?
    @restaurants = Restaurant.where(
      "id NOT IN (
        SELECT restaurant_id
        FROM bookings
        WHERE start_date <= ? AND end_date >= ?
      )",
      end_date, start_date
  )
  else
    @restaurants = Restaurant.all
  end
  
  respond_to do |format|
    format.html
    format.json { render json: @restaurants }
  end
 end
```
