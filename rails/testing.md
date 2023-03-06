#### Add RSpec

If necessary, remove the minitest boilerplate (`rm -rf test/`) and (`gem 'minitest'` from your `Gemfile`. Replace with: 

```ruby
# Gemfile
gem 'rspec-rails'
```
Run the following to generate the necessary files and directories for RSpec:
```
bundle install
rails generate rspec:install
``` 

Finally, configure generators to generate RSpec tests:

```ruby
#  config/application.rb
module App
  class Application < Rails::Application
  config.generators.test_framework = :rspec
```

#### Continuous Integration
