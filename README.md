<div id="top"></div>

<strong>Rails</strong>: 7.1.0.alpha <br>
<strong>Ruby</strong>: 3.1.2p20

### [Rails new](https://guides.rubyonrails.org/getting_started.html)

Run `rails new -h` to view all the options you can pass to `rails new`. For now, I've settled with:
<br>

```rails new myapp -c tailwind -j esbuild -d postgresql -T -M --skip-active-storage --main```
<br>
<br>

* `rails new myapp` creates a new rails application called myapp. If you want use multiple words, the convention is `my_app`
* `-T` skips setting up of tests (so that we can use rspec over the default minitest)
* `-M` don’t setup [Action Mailer](https://guides.rubyonrails.org/action_mailer_basics.html) (used for composing and sending emails)
* `--skip-active-storage` don't setup [Active Storage](https://edgeguides.rubyonrails.org/active_storage_overview.html) (for uploading files to cloud storage services) <br>
* `-j esbuild` sets the JavaScript build tool to [esbuild](https://esbuild.github.io/)
* `-c tailwind` sets the CSS framework to [Tailwind](https://tailwindcss.com/docs/guides/ruby-on-rails)
* `-d postgresql` sets Postgres as the database
<br>

`cd myapp` and run `git branch -m master main` to set the git branch name to main instead of the default master. At this point we can start the server with `bin/dev` (instead of `bin/rails s`) and see our app running at [localhost:3000](http://localhost:3000/). 

* `rails` vs `bin/rails`: if you select the former, RubyGems will activate the latest version of the rails executable it can find in PATH. This is fine as long as you use this version of Rails in your project. Using the latter ensures your environment uses the versions specified in your project's Gemfile. 
* `bin/dev` runs `foreman start -f Procfile.dev`. foreman runs multiple commands, including `bin/rails`, at the same time (take a look at Procfile.dev to see what commands are being run).

<p align="center"><a href="#top">⬆</a></p>

<!-- ### Optional Add-Ons

`cd myapp` and add any gems you want to include in your Gemfile. I'll be adding [Hotwire::Livereload](https://kirillplatonov.com/posts/hotwire-livereload/) which enables live reloading when files are changed without the need for a full browser refresh.

```
group :development do
  gem "hotwire-livereload"
end
```

You'll then need run install script `rails livereload:install`
<br>
<br>
Tailwind uses a [just-in-time compiler](https://v2.tailwindcss.com/docs/just-in-time-mode), so we'll need to specify an additional path for livereload to listen to for any (just-in-time) changes.

```
# config/environments/development.rb
config.hotwire_livereload.listen_paths << Rails.root.join("app/assets/builds")
```

Finally, run `bundle install` to install any additional gems now included in your Gemfile.
<p align="center"><a href="#top">⬆</a></p> -->

