#### Adding RSpec

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
`bundle exec rspec spec/models/user_spec.rb` to run a specific test file. <br>
`bundle exec rspec spec/models` to run a specific folder. 

---

#### Workflow
A workflow is a configurable automated process made up of one or more jobs. 
1. create the `.github/workflows/` in the root directory of your repository
2. create a new file called ci.yml and add the following code.
3. commit these changes and push them to your GitHub repository.

Your new GitHub Actions workflow file is now installed in your repository and will run automatically each time someone pushes a change to the main branch or when a pull request is opened or updated against the main branch. [See](https://docs.github.com/en/actions/learn-github-actions/understanding-github-actions#viewing-the-activity-for-a-workflow-run) for the execution history. 

Understanding [GitHub Actions](https://docs.github.com/en/actions/learn-github-actions/understanding-github-actions) and its [Syntax](https://docs.github.com/en/actions/using-workflows/workflow-syntax-for-github-actions).

```yml
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

#### [Github Actions](https://www.pibit.nl/github/actions/rails/postgres/rspec/tutorial/example/2019/09/23/github-actions-with-rails-postgres-and-rspec/)
Create `config/database.yml.github-actions` and add the following code:
```
test:
  adapter: postgresql
  host: localhost
  encoding: unicode
  database: github-actions
  pool: 20
  username: <%= ENV["POSTGRES_USER"] %>
  password: <%= ENV["POSTGRES_PASSWORD"] %>
```
