#### Gemfile
`gem "devise"`
#### Terminal
`bundle install` <br>
`rails generate devise:install` <br>
`rails generate devise User` <br>
`rails db:migrate` <br>
##### customise devise views:
`rails generate devise:views`

#### protect all routes by default:
```ruby
# app/controllers/application_controller.rb
class ApplicationController < ActionController::Base
  before_action :authenticate_user!
end
```

#### skip for some pages
```ruby
# app/controllers/pages_controller.rb
class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
  end
end
```
#### adding additional attributes to User model
1. Create a migration to add the additional columns to the users table.
2. Add new fields in Devise’s sign up and account update forms.
3. Update the controller:
```ruby
class ApplicationController < ActionController::Base
  # [...]
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name])
  end
end
```
#### Routes
With Devise, actions, such as sign_in action, are not defined in the User controller. Instead, it is defined in the Devise SessionsController, which is automatically generated when you run the rails generate devise User command.

When a user submits their login credentials, Devise automatically routes the request to the appropriate controller action. By default, the create action in the SessionsController handles the login logic.

`devise_for :users` in routes is doing the following:

```
new_user_session            GET           /users/sign_in                  devise/sessions#new
user_session                POST          /users/sign_in                  devise/sessions#create
destroy_user_session        DELETE        /users/sign_out                 devise/sessions#destroy
new_user_password           GET           /users/password/new             devise/passwords#new
edit_user_password          GET           /users/password/edit            devise/passwords#edit
user_password               PATCH         /users/password                 devise/passwords#update
                            POST          /users/password                 devise/passwords#create
cancel_user_registration    GET           /users/cancel                   devise/registrations#cancel
new_user_registration       GET           /users/sign_up                  devise/registrations#new
edit_user_registration      GET           /users/edit                     devise/registrations#edit
user_registration           PATCH         /users                          devise/registrations#update
                            DELETE        /users                          devise/registrations#destroy
                            POST          /users                          devise/registrations#create
```
