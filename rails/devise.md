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
#### adding additional attributed to User model
1. Create a migration to add these columns in the users table.
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
