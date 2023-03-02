

#### AJAX:

```ruby
# restaurant controller
def index
  if params[:query].present?
    # search
  else
    @restaurants = Restaurant.all
  end
  
  respond_to do |format|
    format.html
    format.json { render json: @restaurants }
  end
 end
```

```html.erb
<!-- index.html.erb -->
<div>
  <% @restaurants.each do |restaurant| %>
    <div class="restaurant">
      <h2><%= restaurant.name %></h2>
      <p><%= restaurant.description %></p>
    </div>
  <% end %>
</div>
```
