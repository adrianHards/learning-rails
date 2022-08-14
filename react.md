There are two ways to use React with Ruby on Rails (RoR). The first is to build two standalone apps, with the React app on a different repository, communicating with the backend via an API. This can be achieved with [Create React App](https://reactjs.org/docs/create-a-new-react-app.html) and the Rails CLI. The other is by having both apps in one repository, running side by side.
<br>

---

## Step 1. Creating the [Rails API](https://guides.rubyonrails.org/api_app.html) <br>
```
rails new backend-app --api -T
cd backend-app
```
* `--api` inherits ApplicationController from ActionController::API instead of ActionController::Base (thus omitting views, helpers, and assets)
* `-T` skips the generation of Minitest::Unit files and folders.
<br> <br>

### 1.1 Setup CORS <br>
Very simply, cross origin resource sharing [(CORS)](https://developer.mozilla.org/en-US/docs/Web/HTTP/CORS) defines who’s allowed to interact with our API. Add [rack cors](https://github.com/cyu/rack-cors) to the gemfile:  <br><br>
`gem 'rack-cors'` <br><br>
Then <br><br>
`bundle` <br>

And finally update `config/initializers/cors.rbz to allow all origins (*) to make requests ()
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












https://www.section.io/engineering-education/how-to-integrate-a-react-application-with-rails-api/

https://www.youtube.com/watch?v=sh4WrNGDvQM

https://blog.devgenius.io/create-a-rails-api-with-react-frontend-using-hooks-and-typescript-dcb4e84c3dbf

https://blog.logrocket.com/getting-started-with-create-react-app-d93147444a27/
