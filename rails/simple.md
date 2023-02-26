### [Simple Form](https://github.com/heartcombo/simple_form#collection-check-boxes)

#### Installation
Add it to your Gemfile: <br>
`gem 'simple_form'` <br>

Run the following command to install it: <br>
`bundle install` <br>

Run the generator: <br>
`rails generate simple_form:install`

#### Stimulus
`<%= f.association :book_format, label: false, input_html: { data: { controller: 'book-format-select' } } %>`
