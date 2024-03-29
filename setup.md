- [Rails New](#rails-new)
- [Optional](#optional)
- [Rails Generate](#rails-generate)
- [Command Line](#command-line)
- [Heroku](#heroku)

---
You may want to run a few [updates](https://github.com/adrianHards/rails-guide/blob/main/other/terminal.md) before proceeding with a new project. <br>
### [Rails New](https://guides.rubyonrails.org/getting_started.html)

Run `rails new -h` to view all the options you can pass to `rails new`. For practice apps I've settled with:
<br>

```rails new myapp -c tailwind -j esbuild -d postgresql -T -M```
<br>
<br>

* `rails new myapp` creates a new rails application called myapp. If you want use multiple words, the convention is `my_app`
* `-T` skips setting up of tests (so that we can use rspec over the default minitest)
* `-M` skips [Action Mailer](https://guides.rubyonrails.org/action_mailer_basics.html)
* `-j esbuild` sets the JavaScript build tool to [esbuild](https://esbuild.github.io/)
* `-c tailwind` sets the CSS framework to [Tailwind](https://tailwindcss.com/docs/guides/ruby-on-rails)
* `-d postgresql` sets Postgres as the database
<br>

1. `cd myapp` and run `git branch -m master main` to set the git branch name to main instead of the default master.
2. At this point we can start the server with `bin/dev` (instead of `bin/rails s`) and see our app running at [localhost:3000](http://localhost:3000/).
3. `open http://localhost:3000`

* `rails` vs `bin/rails`: if you select the former, RubyGems will activate the latest version of the rails executable it can find in PATH. This is fine as long as you use this version of Rails in your project. Using the latter ensures your environment uses the versions specified in your project's Gemfile.
* `bin/dev` runs `foreman start -f Procfile.dev`. foreman runs multiple commands, including `bin/rails`, at the same time (take a look at Procfile.dev to see what commands are being run).
* `gh repo create --public --source=.` will create a public repo on GitHub

<p align="center"><a href="#top">⬆</a></p>

---

### Optional

1. Add any gems you want to include in your <strong>Gemfile</strong>. For example, I like to add `gem "responders"` for [respond_with](https://github.com/heartcombo/responders) which allows you to do [this](/tasks_controller.rb).
2. Run `bundle install` to install any additional gems now included in your Gemfile. For responders, you also need to run:
```
bundle install
bin/rails g responders:install
```
3. `touch .rubocop.yml` to the root of your project and [disable](https://docs.rubocop.org/rubocop/configuration.html) checks here.

<!-- I'll be adding [Hotwire::Livereload](https://kirillplatonov.com/posts/hotwire-livereload/) which enables live reloading when files are changed without the need for a full browser refresh.

```
group :development do
  gem "hotwire-livereload"
end
```
2. We'll then need run install script `rails livereload:install`
3. Tailwind uses a [just-in-time compiler](https://v2.tailwindcss.com/docs/just-in-time-mode), so we'll need to specify an additional path for livereload to listen to for any (just-in-time) changes.

```
# config/environments/development.rb
config.hotwire_livereload.listen_paths << Rails.root.join("app/assets/builds")
``` -->
<p align="center"><a href="#top">⬆</a></p>

---

### Rails Generate
`bin/rails g <name of generator> <options>` <br><br>
Additional options include: [--no-helper](https://www.rubyguides.com/2020/01/rails-helpers/) and `--no-test-framework`
<br><br>

<strong>Undo</strong>:
* `bin/rails d controller name <actions>`
* `bin/rails d model name`

#### Resource
`bin/rails g resource movie title:string description:text` <br>
* generates a migration file, a model, a controller, views and the routes for the given class, but does not populate these files with anything else (unlike `scaffold`)


#### Migrations
```
bin/rails g migration add_name_to_doctors name:string
bin/rails g migration remove_name_from_doctors name:string
bin/rails g migration add_doctor_to_patients doctor:references
```

The first command will create a migration file e.g. `20200928055457_add_name_to_doctors.rb` that contains:

```
class AddNameToDoctors < ActiveRecord::Migration[7.0]
   def change
     add_column :doctors, :name, :string
   end
end
```

* create an empty database for you: <br>
`bin/rails db:create`
* update the schema: <br>
`bin/rails db:migrate`
* drop the database, create it again and re-seed: <br>
`bin/rails db:reset` <br>
`bin/rails db:drop` to drop the db only
* load data from the file: db/seeds.rb into the database <br>
`bin/rails db:seed`
* undoes the last migration, you can then edit the file, and run rails db:migrate again <br>
`bin/rails db:rollback`
* delete a migration file, for example, if you make a typo and haven't migrated yet <br>
`bin/rails d migration SameMigrationNameAsUsedToGenerate`
* if you've truly messed things up (e.g. deleted a migration file by accident), simply delete **schema.db** and re-run `rails db:migrate`

#### Models
`bin/rails g model Doctor first_name last_name speciality:text patient:has_many`<br>
* a database migration that will add a table and add the columns first_name, last_name, and speciality.
* a model file that will inherit from ApplicationRecord
* if the data type is a string, you don’t need to specify their type.
* patient:has_many will result in models and migration files being generated for both Doctor and Patient, with has_many and belongs_to

#### Controllers

`bin/rails g controller Doctors index save`
* provide a controller file and corresponding views folder
* populate controller file with e.g. `def index end` and `index.html.erb` files inside of corresponding views folder

<p align="center"><a href="#top">⬆</a></p>

---

### [Command Line](https://guides.rubyonrails.org/command_line.html)

* `bin/setup` executes setup script placed in the bin directory; add e.g. `bin/rails db:setup` for a consistent setup
* `bin/rails console` start rails console
* `bin/rails routes | grep doctor` only shows us the routes for doctors

<p align="center"><a href="#top">⬆</a></p>

---

### [Heroku](https://devcenter.heroku.com/articles/getting-started-with-rails7)

- Log in to Heroku <br>
`heroku login` <br>
- Open current app in default browser <br>
`heroku open` <br>
- Launch Rails console <br>
`heroku run rails console` <br>
- see live stream of app's logs <br>
`heroku logs --tail` <br>
- delete database <br>
`heroku pg:reset DATABASE --confirm APP-NAME` or <br>
`heroku restart; heroku pg:reset DATABASE --confirm APP-NAME; heroku run rake db:setup` <br>
- recreate database and run migrations <br>
`heroku run rake db:migrate` <br>
- populate database with seed <br>
`heroku run rake db:seed` <br>
- to combine previous two steps: <br>
`heroku run rake db:setup` <br>
- list previous versions of your app <br>
`heroku releases`
- rollback to # version <br>
`heroku rollback [RELEASE #]`

<p align="center"><a href="https://github.com/adrianHards/rails-templates">Home</a></p>
