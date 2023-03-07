
## Movies
Lets assume we want to search our database of movies and update our index every time there is a `keyup` event **without** a page refresh. Our html is made up of three files, the index and two partials. 

### Views

##### index.html.erb
On the index.html.erb file we attach a target to the form itself and the search bar. Note that the stimulus controller, `search-movies`, contains all of the targets and the `<%= render "list", movies: @movies %>`. Note we pre-fill the input field with the value of the :query parameter if it is present in the URL query string. Finally, we use the Rails form helper [form_with](https://guides.rubyonrails.org/form_helpers.html). 
```html.erb
<div data-controller="search-movies">
  <%= form_with url: movies_path, method: :get, html: {class: "mb-4", data: { search_movies_target: 'form' }} do |f| %>
    <%= f.label :query, "Type a movie title" %>
    <%= f.text_field :query,
                     class: "form-control",
                     value: params[:query],
                     data: { 
                      search_movies_target: 'input', 
                      action: 'keyup->search-movies#update' 
                     }
                     %>
  <% end %>
    
  <%= render "list", movies: @movies %>
</div>
```
Lets also add a target to the movies list, which we'll update with AJAX as the user searches a movie. Notice it still falls under _view_ of the `search-movies` controller. 
##### _list.html.erb
```html.erb
<div data-search-movies-target="list">
  <div class="movies">
    <% movies.each do |movie| %>
      <%= render "movie_infos", movie: movie %>
    <% end %>
  </div>
</div>
```
Finally we have the movie card partial, which we'll add a new stimulus controller to which we'll use to update a movie with AJAX. This will therefore involve a PATCH request. This will be performed via a simple form, which is initially hidden until the Bootstrap class d-none is removed via the displayForm action. We add the target `card` to the movie-card, as this will be what is updated. An action that reveals the edit form. And an action when a user submits the form. 

##### _movie_infos.html.erb
```html.erb
<div class="movie-card" data-controller="edit-movie" data-edit-movie-target="card">
  <%= image_tag movie.image_url %>

  <div class="movie-infos" data-edit-movie-target="infos">
    <h2><%= movie.title </h2>
    <button aria-label="Edit movie" data-action="click->edit-movie#displayForm">
      <i class="fa-solid fa-pen fa-xs ml-2"></i>
    </button>
  </div>

  <%= simple_form_for movie, html: {class: "d-none", data: { edit_movie_target: 'form', action: 'submit->edit-movie#update' }} do |f| %>
    <%= f.input :title %>
    <%= f.input :year %>
    <%= f.submit "update movie", class: "btn btn-primary" %>
  <% end %>
</div>     
```

## Quick notes!
* A **URI** is a string of characters that identifies a resource, while a **URL** is a type of URI that identifies the location of a resource and specifies the protocol to use to access it. <br>
* use `rails g stimulus search-movies` to generate your Stimulus controller <br>
* check your target values with:
```js
static targets = ["form", "input", "list"]

connect() {
  console.log(this.formTarget)
  console.log(this.inputTarget.value) // whatever the use has typed in to the search bar
  console.log(this.listTarget)
}
```
* `params` is a hash that contains the parameters submitted in the request. 
* the `require` method ensures that the :movie parameter is present, and raises an error if it is not. This is a security measure to prevent unauthorized parameters from being passed in the request.
* The permit method specifies a list of allowed parameters for the Movie model. In this case, only the :title and :year parameters are allowed. This is also a security measure that prevents users from submitting unwanted or malicious parameters.

## Search
### Stimulus controller
* `this.formTarget.action` will tell you what the form is submitting to (i.e. the URI) by default along with any params (e.g. `http://localhost:3000/movies?query=batman`)

##### search_movies_controller.js

Here, we define the update action. We trigger an HTTP request so that our web browser can communicate with our server/database. 

```js
update() {
  const url = `${this.formTarget.action}?query=${this.inputTarget.value}`
  fetch(url, { 
    headers: { "Accept": "text/plain" } 
  }) // pass header to say what format you want to receive response back in
    .then(response => response.text()) // the response is expected to be plain text so we parse with .text()
    .then((data) => {
      this.listTarget.outerHTML = data // replace whole piece of DOM with data
    })
}
```
### Rails controller
##### movies_controller.rb

```ruby
  def index
    @movies = Movie.order(year: :desc, title: :asc)

    if params[:query].present?
      @movies = @movies.where("title ILIKE ?", "%#{params[:query]}%")
    end

    respond_to do |format|
      # if HTML provide full index.html.erb page
      format.html
      # if text, render list partial only, not whole page, where locals are @movies as needed in the partial coming from the above search
      format.text { render partial: "movies/list", locals: { movies: @movies }, formats: [:html] }
      # without formats: [:html] would be looking for a .txt partial
    end
  end
```
## Update
### Stimulus Controller
##### search_movies_controller.js
```js

```
### Rails Controller
##### movies_controller.rb
```ruby
def update
  @movie = Movie.find(params[:id])
  @movie.update(movie_params)

  respond_to do |format|
    format.html { redirect_to movies_path }
    format.text { render partial: "movies/movie_infos", locals: { movie: @movie }, formats: [:html] }
  end
end

private

# sanitized hash
def movie_params
  params.require(:movie).permit(:title, :year)
end
```











## Other

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
Docs:
> [pg_search](https://github.com/Casecommons/pg_search)

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
