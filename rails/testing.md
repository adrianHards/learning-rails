#### Add RSpec

##### Remove Minitest

If necessary, remove the minitest boilerplate (`rm -rf test/`) and (`gem 'minitest'` from your `Gemfile`. Replace with: 

##### Add RSpec 
```ruby
# Gemfile
group :development, :test do
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
##### Generate RSpec tests
If you've already created a Rails model and you want to add RSpec tests for it, do the following: <br>
e.g. `rails generate rspec:model User`

##### Run tests:

`bundle exec rspec` to run all the RSpec tests in your project <br>
`bundle exec rspec spec/models/user_spec.rb` to run a specific test file. 

#### Continuous Integration

```ruby
name: github workflow
on:
  push:
    branches: [main]
  pull_request:
    branches: [main]
jobs:
  build:
    runs-on: ubuntu-latest
    services:
      postgres:
        image: postgres:11
        ports:
          - 5432:5432
        env:
          POSTGRES_USER: postgres
          POSTGRES_PASSWORD: postgres
        options: --health-cmd pg_isready --health-interval 10s --health-timeout 5s --health-retries 5
    steps:
      - uses: actions/checkout@v1
      - uses: ruby/setup-ruby@v1
        with:
          bundler-cache: true
      - name: Setup Database
        run: |
          cp config/database.yml.github-actions config/database.yml
          bundle exec rake db:create
          bundle exec rake db:schema:load
        env:
          RAILS_ENV: test
          POSTGRES_USER: postgres
          POSTGRES_PASSWORD: postgres
      - name: Run RSpec
        run: COVERAGE=true bundle exec rspec  --require rails_helper
        env:
          RAILS_ENV: test
          POSTGRES_USER: postgres
          POSTGRES_PASSWORD: postgres

```
