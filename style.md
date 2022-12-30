Why should I read this?

There are many different ways of writing code that achieve the same goal. However, most programmers agree there are some ways of writing code that are more readable than others. To help write more understandable code, programmers follow style guides. These provide guidelines for how to write code, structure it and avoid common problems.



This style guide is not complete

But it doesn’t need to be. If there’s anything you’d like to add, please do so! Just remember there’s little point adding all the rules our linters already cover. If you’re looking for a more detailed style guide, please visit the ones listed below. And If there’s a linter, formatter or library you’d like to add, please make sure it’s still in use and updated frequently. 





Table of Contents







For you to install

Rubocop Installation (already added)

Documentation

only one person needs to complete the following setup at the start of a project

once pushed to GitHub, everyone else just needs to run bundle install

install each of the VS Code extensions list below

visit your VS Code settings and complete the following. 

Setup

From your terminal, cd to the project’s root and:

group :development, :test do
  gem "standard", require: false
  gem "rubocop-rails", require: false
  gem "rubocop-rspec", require: false

This adds StandardRB as the base (a less aggressive version of Rubocop) for Ruby and Rubocop for Rails and RSpec (see). 

bundle install

standardrb --fix to automatically fix offences (use this most of the time)

rubocop -a RuboCop will try to safely automatically fix offences

rubocop -A to run all auto-corrections (safe and unsafe) (generally not recommended)

We also have the option of installing the Annotate gem, the use of which is discussed here. 



ESLint with Standard and Prettier (already added)

only one person needs to complete the following setup at the start of a project

Prettier

Documentation

From your terminal cd, to the project’s root and run the following to install prettier:

yarn add --dev --exact prettier
echo {}> .prettierrc.json
touch .prettierignore

Open up the “.prettierignore” file in VSCode and add the following to tell prettier to not reformat code there. 

tmp/
public/packs/

Run prettier with

yarn prettier --write .



ESLint

Documentation

yarn add --dev eslint-config-prettier
yarn add eslint --dev
yarn add babel-eslint --dev
yarn add eslint-plugin-react --dev
touch .eslintrc.json

Open up your .eslintrc.json file and add in:

{
  "env": {
    "browser": true,
    "node": true,
    "commonjs": true,
    "es2021": true
  },
  "extends": [
    "eslint:recommended",
    "prettier"
  ],
  "parserOptions": {
    "ecmaVersion": 12
  },
  "rules": {
  }
}

This sets up our ESLint config to let the linter know we are expecting our JavaScript to use modern conventions, and play nice with react and prettier. Save the file. 

touch .eslintignore

Open the above file and add:

tmp/
public/packs/

Save and run yarn run eslint



Finally, let’s go ahead and install the Prettier and ESLint extensions in our VSCode so they will run automatically when we write JavaScript and save files.

VSCode

ESLint helps you find and fix problems with your JavaScript code

Prettier a tool that auto-rearranges your code

Headwind parses your code and reprints class tags to follow a given order

Ruby





Complete Style Guides

JavaScript

AirBnB’s JavaScript Style Guide

Ruby

AirBnB’s Ruby Style Guide

GitHub’s Ruby Style Guide

Ruby on Rails

Rubocop’s Rails Style Guide

RSpec

Better Spec’s RSpec Style Guide

Rubocop’s RSpec Style Guide





General

Commented out code

// 🛑 Do not do this
function addToShoppingList(item) {  
  // console.log("Shopping list before", shoppingList);  
  // console.log("Adding item", item);  
  shoppingList.add(item);  
  // console.log("Shopping list after", shoppingList);
}

When you (or someone else) is reading your code, you want to see only what’s important. Removing commented out code helps find the relevant code faster and easier.



Unused variables

const orderTaxi = (pickUpTime) => {  
  let driverName = getDriverName();  
  let customerName = getCustomerName(); // 🛑 Don't do this!
  return `${driverName} will pick you up at ${pickUpTime}`;
}

Often when we refactor, some variables become unused. Don’t forget to remove them! Someone might come along, look at your code and assume it’s important. 



Indentation

Ensure your default tab size (indicated at the bottom right of your screen in VSCode) is set to 2



Good scoping of your variables

Define your variables with the narrowest scope they can have. For example:

// 🛑 Do not do this
function findLongestFirstName(fullNames) {
  let longest;
  let firstName;
  for (let i = 0; i < fullNames.length; i++) {
    firstName = fullNames[i].split(" ")[0];
    if (!longest || firstName.length > longest.length) {
      longest = firstName;
    }
  }
  return longest;
}

As your code becomes more complex it will be harder to keep track of what variable is used where.

// ✅ Do this instead
const findLongestFirstName = (fullNames) => {
  let longest;
  for (let i = 0; i < fullNames.length; i++) {
    let firstName = fullNames[i].split(" ")[0];
    if (!longest || firstName.length > longest.length) {
      longest = firstName;
    }
  }
  return longest;
}



Naming your variables and functions

When thinking about whether a variable name is good, try to imagine that you are reading the code again in the future and you have forgotten exactly how it works. Do the variable names help explain what the code is supposed to do?



Avoid short names

Very short variable names can be difficult to understand since the purpose of the variable can be unclear. They are also difficult to remember, especially if there are many similarly named variables. Try to avoid short names or abbreviations.

Here are some examples of bad names that you should avoid:

Single letters like x or y

Abbreviations like evt instead of event

Generic names like array or string



Describe what something is/does

A good variable name quickly explains what it represents to anyone reading the code. 

// 🛑 Try to avoid this
let song = true;

// ✅ This is better
let isPlaying = true;

The isPlaying variable name is better since it tells us whether a song is playing or not.



// 🛑 Try to avoid this
const percentage = () => {
  // ...
}

// ✅ This is better
const getPercentage = () => {
  // ...
}

Here we should use the "get" verb to show that it returns something.



// 🛑 Try to avoid this
const isOldEnough = (number) => {
  // ...
}

// ✅ This is better
const isOldEnough = (yearOfBirth) => {
  // ...
}

Parameters of functions should also have names that properly represent what is going to be received into the function.



Avoid long functions​

Most of the time it is better to split a long function into a few shorter ones. This will:

Make your code easier to read

Make your code easier to maintain

Make your code easier to review by out volunteers

Try to keep in mind that you will only ever write the code once, but you will read the code many times. Always aim to write code that is readable. See The Art of Writing Small and Plain Functions. 



Use Git rather than commenting out old code

And if you want something back, you can always look at the deleted code in the git history.





Tailwind

Mobile first

You should only ever be using md (for tablets) and lg (for desktops); styling without either is for mobile, which is what we should be developing for first. For example:

class="text-sm md:text-lg lg:text-xl"

This means, for mobiles the text will be ‘small’, on tablets it’ll be ‘large’ and on desktops it’ll be ‘extra large’



Headwind

Headwind works globally once installed and will run on save if a tailwind.config.js file is present within your working directory. Alternatively, you can trigger Headwind by:

Pressing CMD + Shift + T on Mac

Pressing CTRL + ALT + T on Windows

For customisation options, visit here. 





Git

Commit early, commit often

To ensure more focused commits and a cleaner git history



One Pull Request for one feature





JavaScript

See AirBnB’s JavaScript style guide

Functions

Use ES6 Syntax

Rather than write it all out here, please visit this site for a fantastic overview. 



Naming conventions

Use camelCase for methods and variables. 



Variables

Use const over let and never var

var myAge = 21; // 🛑 Do not use
let yourAge = 21; // ✅ Use for values that change
const secondsInMinute = 60; // ✅ Use for values that never change

Briefly, let can be updated but not re-declared. const cannot be updated or re-declared. Of the two, it is better to use const to avoid involuntary reassignments. More info and a discussion. 





Ruby

See GitHub’s or AirBnB’s style guide

Naming conventions

Use snake_case for methods and variables. 

Use CamelCase for classes and modules.

Use SCREAMING_SNAKE_CASE for other constants.



Rails

See Rubocop’s style guide



Views

Use partials to DRY up your views

Treat them as a way to move details out of a view so that you can grasp what’s going on more easily by having less code on any one page. For example, you might have a view that looked like this:

<%= render "shared/ad_banner" %>
 
<h1>Products</h1>
 
<p>Here are a few of our fine products:</p>
...
 
<%= render "shared/footer" %>

Here, the _ad_banner.html.erb and _footer.html.erb partials contain content that is shared among many pages. 



Seeds

Use puts or p with interpolation before and after the creation of a new class. 

If using .create, add ! to the end; this will result in a meaningful alert if the class you’re trying to create isn’t valid. For example:

p "Category count is #{Category.count}. Destroying all categories"
Category.destroy_all
p "All categories destroyed. Category count is now #{Category.count}"

p 'Creating 4 categories'

Category.create!([
  { name: 'Home', emoji: '🏠' },
  { name: 'Work', emoji: '👨‍💻' },
  { name: 'Social', emoji: '🧉' },
  { name: 'Groceries', emoji: '🍏' },
])

p "Created #{Category.count} new categories"



RSpec

incomplete

See Better Specs or Rubocop’s style guide



Continuous Integration

incomplete

See GitHub and this for more detail





References

CodeYourFuture's Style Guide

Setting Up ESLint

Setting Up Rubocop

StandardJS
