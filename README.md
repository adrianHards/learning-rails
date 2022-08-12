<!-- # README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ... -->

https://betterprogramming.pub/react-with-rails-2022-bd28e1fcd355

<div id="top"></div>

Here I'll be learning how to use Rails alongside [Tailwind](https://tailwindcss.com/) and [React](https://reactjs.org/tutorial/tutorial.html), and create a template for future projects in the process. [TypeScript](https://www.typescriptlang.org/docs/) is absent, for now. This is a work in progress, so follow at your own peril...
<br>
<br>

Contents:
<ol>
  <li><a href="#rails-new">rails new</a></li>
<!--   <li><a href="#optional-add-ons">optional add-ons</a></li> -->
  <li><a href="#react-installation">React installation</a></li>
</ol>

<hr>

### [Rails new](https://guides.rubyonrails.org/getting_started.html)

Run `rails new -h` to view all the options you can pass to `rails new`. For now, I've settled with:
<br>
<br>

```rails new myapp -c tailwind -j esbuild -d postgresql -T -M --skip-active-storage --main```
<br>
<br>

* `rails new myapp` creates a new rails application called myapp
* `-T` skips setting up of tests (so that we can use rspec over the default minitest)
* `-M` don’t setup [Action Mailer](https://guides.rubyonrails.org/action_mailer_basics.html) (used for composing and sending emails)
* `--skip-active-storage` don't setup [Active Storage](https://edgeguides.rubyonrails.org/active_storage_overview.html) (for uploading files to cloud storage services) <br>
* `-j esbuild` sets the JavaScript build tool to [esbuild](https://esbuild.github.io/)
* `-c tailwind` sets the CSS framework to [Tailwind](https://tailwindcss.com/docs/guides/ruby-on-rails)
* `-d postgresql` sets Postgres as the database
* `--main` sets the git branch name to main instead of the default master

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

### React Installation

```
# Make some folders and files for our React application
mkdir app/javascript/components
touch app/javascript/components/application.js

# Add in our React dependencies
yarn add react react-dom

# Create a basic components controller that we will set as our root route.
bin/rails g controller components index

# Start the server - we use `bin/dev` instead of `bin/rails s`
bin/dev
```

At this point our project should be running on [localhost:3000](http://localhost:3000/), though there are further changes we need to make. Lets start by replacing the contents of the `app/javascript/application.ts` with:

```
// Entry point for the build script in your package.json
import "@hotwired/turbo-rails";
import "./components/application";
```
to add a reference to components/application where our contrived React application code will go. 
<br>
<br>
Finally, we need to update the code within `app/javascript/components/application.js` to the following:
```
import * as React from "react";
import * as ReactDOM from "react-dom";

interface AppProps {
  arg: string;
}

const App = ({ arg }: AppProps) => {
return <div>{`Hello, ${arg}!`}</div>;
};

document.addEventListener("DOMContentLoaded", () => {
const rootEl = document.getElementById("root");
ReactDOM.render(<App arg="Rails 7 with ESBuild" />, rootEl);
});
```
The above code simply defines a React component that will be rendered to the DOM

<p align="center"><a href="#top">⬆</a></p>
