Here, we're going to create two repositories. One for the backend, which we'll create with Rails, and another for the frontend, which will create with React.
<br> <br>

# Step 1. Creating the [Rails API](https://guides.rubyonrails.org/api_app.html) <br>

```
rails new rails-backend --api -d postgresql
cd rails-backend
```

- `--api` inherits ApplicationController from ActionController::API instead of ActionController::Base (thus omitting views, helpers, and assets)

<br>

# Step 2. Create a resource

```
rails g resource movie title:string description:text

rails db:create
rails db:migrate
```

This will generate:

```
invoke  active_record
create  db/migrate/20230204163820_create_movies.rb
create  app/models/movie.rb
invoke  test_unit
create  test/models/movie_test.rb
create  test/fixtures/movies.yml
invoke  controller
create  app/controllers/movies_controller.rb
invoke  test_unit
create  test/controllers/movies_controller_test.rb
invoke  resource_route
route   resources :movies
```

### Step 2.1 Seed the database

```
# db/seeds.rb
puts "destroying all movies"

Movie.destroy_all

puts "there are #{Movie.all.count} movies"

puts "creating 3 movies"

increment = 1
3.times do
  Movie.create(title: "Movie #{increment}", description: "Description of movie #{increment}")
  increment += 1
end

puts "created #{Movie.all.count} movies"
```

```
rails db:seed
```

### Step 2.2 Setup the controller

```
# controllers/movies_controller.rb
def index
  @movies = Movie.all
  render json: @movies
end
```

Run `bin/rails s` to start the server and visit http://localhost:3000/movies; you should see JSON (in this instance, an array of each of our movie instances).

## Step 3 Setup CORS

Add `gem 'rack-cors'` to your gemfile
Run `bundle install`

`touch config/initializers/cors.rb` and add the following:

```
# initializers/cors.rb
Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'http://localhost:3001'
    resource '*', headers: :any, methods: [:get, :post, :put, :patch, :delete, :options, :head]
  end
end
```

M
