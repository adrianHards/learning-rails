Docs:
> [Le Wagon](https://kitt.lewagon.com/camps/1108/lectures/05-Rails%2F09-Airbnb-SMTP#source) <br>
> [pg_search](https://github.com/Casecommons/pg_search)

#### Form

```html.erb
<%= form_with url: dogs_path, method: :get, class: "d-flex" do %>
  <%= date_field_tag :start_date,
    value: params[:start_date],
    class: "form-control",
    placeholder: "Start date"
  %>
  <%= date_field_tag :end_date,
    value: params[:end_date],
    class: "form-control",
    placeholder: "End date"
  %>
  <%= submit_tag "Search", class: "btn btn-primary" %>
<% end %>
```

#### SQL, page refresh:

```ruby
  if params[:start_date].present?
    start_date = params[:start_date].to_date.strftime("%Y-%m-%d")
    end_date = params[:end_date].to_date.strftime("%Y-%m-%d")
    @dogs = Dog.where(
      "id NOT IN (
        SELECT dog_id
        FROM bookings
        WHERE start <= ? AND \"end\" >= ?
      )",
      end_date, start_date
    )
    raise
  else
    @dogs = Dog.all
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
