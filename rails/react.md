# Rails as a Backend API

**Rails** will serve as the backend/server-side component of our application. The backend will handle the data storage and retrieval, processing, and other logic for our application. **React** will serve as the frontend/client-side component of our application. The frontend will handle the user interface, interaction, and display of data for our application.

To allow the frontend and backend components to communicate and exchange data, we will be using an API (Application Programming Interface). An API is a set of rules and protocols that define how the frontend and backend components will interact with each other. The frontend will send HTTP requests to the backend, and the backend will respond with the requested data. 

<br>

# Rails

## Step 1. Creating the [Rails API](https://guides.rubyonrails.org/api_app.html) <br>

```
rails new rails-backend --api -d postgresql
cd rails-backend
```

- `--api` inherits ApplicationController from ActionController::API instead of ActionController::Base (thus omitting views, helpers, and assets)

<br>

## Step 2. Create a resource

```
bin/rails g resource movie title:string description:text
bin/rails db:create
bin/rails db:migrate
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

```ruby
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
bin/rails db:seed
```

### Step 2.2 Setup the controller

```ruby
# controllers/movies_controller.rb
def index
  @movies = Movie.all
  render json: @movies
end
```

Run `bin/rails s` to start the server and visit http://localhost:3000/movies; you should see JSON (in this instance, an array of each of our movie instances).

## Step 3. Setup CORS

CORS stands for Cross-Origin Resource Sharing. It is a security feature implemented by web browsers that restricts the ability of a web page to make requests to a domain different to the one that served the web page (in our case, localhost:3000 vs 3001). This is done to prevent malicious websites from making unauthorized requests to other domains, which could result in the theft of sensitive data or other security risks.

Add `gem 'rack-cors'` to your gemfile then run `bin/bundle install`

`touch config/initializers/cors.rb` and add the following:

```ruby
# initializers/cors.rb
Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'http://localhost:3001'
    resource '*', headers: :any, methods: [:get, :post, :put, :patch, :delete, :options, :head]
  end
end
```

## Step 4. Change your default port in development

Let's change the default port for Rails so it doesn't conflict with React (which we'll allow to occupy 3000).

By specifying a different port, we can run multiple web applications on the same device, each accessible via a unique port number. For example, we will have a Rails API running on port 3001 and a React front-end running on port 3000. We'll then configure the front-end to communicate with the API by sending requests to http://localhost:3001.

```ruby
# config/puma.rb
port ENV.fetch("PORT", 3001)
```

# React

## Step 5. create-react-app

```
npx create-react-app react-frontend
cd react-frontend
```

## Step 6. Fetch data

```js
# src/App.js
import React, { useState, useEffect } from 'react';

function App() {
  const [movies, setMovies] = useState([]);

  useEffect(() => {
    fetch('http://localhost:3001/movies')
      .then(response => response.json())
      .then(data => setMovies(data));
  }, []);

  return (
    <ul>
      {movies.map(movie => (
        <li key={movie.id}>
          {movie.title}: {movie.description}
        </li>
      ))}
    </ul>
  );
}

export default App;
```

Restart both the Rails and React servers, each in a different terminal session starting with Rails:

```
bin/rails s
npm start
```

And we're done! Check http://localhost:3000/ to see a list of all your movies!

## Axios

```js
import React, { useState, useEffect } from 'react';
import axios from 'axios';

function App() {
  const [movies, setMovies] = useState([]);
  
  useEffect(() => {
    axios
      .get('http://localhost:3001/movies')
      .then(response => setMovies(response.data));
   }, []);

  return (
    <ul>
      {movies.map(movie => (
        <li key={movie.id}>
          {movie.title}: {movie.description}
        </li>
      ))}
    </ul>
  );
}

export default App;
```
