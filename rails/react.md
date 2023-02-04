# Incomplete

We are going to create two repositories. One for the backend, which will be created with Rails, and another for the frontend, which will created with React.
<br>

---

### Step 1. Creating the [Rails API](https://guides.rubyonrails.org/api_app.html) <br>

```
rails new rails-backend --api -d postgresql
cd rails-backend
```

- `--api` inherits ApplicationController from ActionController::API instead of ActionController::Base (thus omitting views, helpers, and assets)

<br>

### Step 2. Create a resource

```
rails g resource movie title:string description:text
```

- This will generate:
  1. a `migration` to create a table for movies in db/migrate/\_create_movies.rb;
  2. an `Movie model` in app/models/movie.rb;
  3. a `Movie controller` in app/controllers/movies_controller.rb;
  4. all CRUD actions in config/routes.rb

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

```
rails db:create
rails db:migrate
```

<!--
### 1.1 Setup CORS <br>
Very simply, cross origin resource sharing [(CORS)](https://developer.mozilla.org/en-US/docs/Web/HTTP/CORS) defines who’s allowed to interact with our API. We can implement this with the gem [rack cors](https://github.com/cyu/rack-cors). Run the following to add it to the gemfile:  <br><br>
`gem 'rack-cors'` <br><br>
Then <br><br>
`bundle` <br>

And finally update `config/initializers/cors.rbz` to allow all origins (*) to make requests (for testing purposes only)
```
Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins '*'
resource '*',
      headers: :any,
      methods: [:get, :post, :put, :patch, :delete, :options, :head]
  end
end
```
... <br>
To be continued <br>
...
 -->

<!--
https://www.section.io/engineering-education/how-to-integrate-a-react-application-with-rails-api/

https://www.youtube.com/watch?v=sh4WrNGDvQM

https://blog.devgenius.io/create-a-rails-api-with-react-frontend-using-hooks-and-typescript-dcb4e84c3dbf

https://blog.logrocket.com/getting-started-with-create-react-app-d93147444a27/

https://hibbard.eu/rails-react-crud-app/
 -->
