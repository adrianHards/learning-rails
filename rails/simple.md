### [Simple Form](https://github.com/heartcombo/simple_form#collection-check-boxes)

#### Installation
1. Add it to your Gemfile: <br>
`gem 'simple_form'` <br>
2. Install the gem. <br>
`bundle install` <br>
3. Generate the Simple Form initializer file by running the following command: <br>
`rails generate simple_form:install` <br>

By default, Simple Form uses the Bootstrap CSS classes for styling. To disable this, add the following line:
```ruby
# config/initializers/simple_form.rb
config.default_form_class = ''
```

#### Stimulus
`<%= f.association :book_format, label: false, input_html: { data: { controller: 'book-format-select' } } %>`
