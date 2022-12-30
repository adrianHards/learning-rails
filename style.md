#### Why should I read this?

There are many different ways of writing code that achieve the same goal. However, most programmers agree there are some ways of writing code that are more readable than others. To help write more understandable code, programmers follow style guides. These provide guidelines for how to write code, structure it and avoid common problems.

#### This style guide is not complete

But it doesn’t need to be. If there’s anything you’d like to add, please do so! Just remember there’s little point adding all the rules our linters already cover. If you’re looking for a more detailed style guide, please visit the ones listed below. And If there’s a linter, formatter or library you’d like to add, please make sure it’s _still in use and updated frequently_.

* * *

#### Table of Contents

/\*<!\[CDATA\[\*/ div.rbtoc1672404885942 {padding: 0px;} div.rbtoc1672404885942 ul {list-style: circle;margin-left: 0px;} div.rbtoc1672404885942 li {margin-left: 0px;padding-left: 0px;} /\*\]\]>\*/

*   [For you to install](#CodeStyleGuide-Foryoutoinstall)
    *   [Rubocop Installation (already added)](#CodeStyleGuide-RubocopInstallation(alreadyadded))
    *   [ESLint with Standard and Prettier (already added)](#CodeStyleGuide-ESLintwithStandardandPrettier(alreadyadded))
    *   [VSCode](#CodeStyleGuide-VSCode)
*   [Complete Style Guides](#CodeStyleGuide-CompleteStyleGuides)
    *   [JavaScript](#CodeStyleGuide-JavaScript)
    *   [Ruby](#CodeStyleGuide-Ruby)
    *   [Ruby on Rails](#CodeStyleGuide-RubyonRails)
    *   [RSpec](#CodeStyleGuide-RSpec)
*   [General](#CodeStyleGuide-General)
    *   [Commented out code](#CodeStyleGuide-Commentedoutcode)
    *   [Unused variables](#CodeStyleGuide-Unusedvariables)
    *   [Indentation](#CodeStyleGuide-Indentation)
    *   [Good scoping of your variables](#CodeStyleGuide-Goodscopingofyourvariables)
    *   [Naming your variables and functions](#CodeStyleGuide-Namingyourvariablesandfunctions)
    *   [Avoid long functions](#CodeStyleGuide-Avoidlongfunctions​)
    *   [Use Git rather than commenting out old code](#CodeStyleGuide-UseGitratherthancommentingoutoldcode)
*   [Tailwind](#CodeStyleGuide-Tailwind)
    *   [Mobile first](#CodeStyleGuide-Mobilefirst)
    *   [Headwind](#CodeStyleGuide-Headwind)
*   [Git](#CodeStyleGuide-Git)
    *   [Commit early, commit often](#CodeStyleGuide-Commitearly,commitoften)
    *   [One Pull Request for one feature](#CodeStyleGuide-OnePullRequestforonefeature)
*   [JavaScript](#CodeStyleGuide-JavaScript.1)
    *   [Functions](#CodeStyleGuide-Functions)
    *   [Naming conventions](#CodeStyleGuide-Namingconventions)
    *   [Variables](#CodeStyleGuide-Variables)
*   [Ruby](#CodeStyleGuide-Ruby.1)
    *   [Naming conventions](#CodeStyleGuide-Namingconventions.1)
*   [Rails](#CodeStyleGuide-Rails)
    *   [Views](#CodeStyleGuide-Views)
    *   [Seeds](#CodeStyleGuide-Seeds)
    *   [RSpec](#CodeStyleGuide-RSpec.1)
*   [References](#CodeStyleGuide-References)

* * *

For you to install
------------------

### Rubocop Installation (already added)

[Documentation](https://docs.rubocop.org/rubocop/index.html)

- [x] only one person needs to complete the following setup at the start of a project
- [ ] once pushed to GitHub, everyone else just needs to run bundle install
- [ ] install each of the VS Code extensions list below
- [ ] visit your VS Code settings and complete the [following](https://github.com/testdouble/standard/wiki/IDE:-vscode).

#### Setup

*   From your terminal, `cd` to the project’s root and:
    

```java
group :development, :test do
  gem "standard", require: false
  gem "rubocop-rails", require: false
  gem "rubocop-rspec", require: false
```

This adds [StandardRB](https://github.com/testdouble/standard) as the base (a less aggressive version of Rubocop) for Ruby and Rubocop for Rails and RSpec ([see](https://www.fastruby.io/blog/ruby/code-quality/how-we-use-rubocop-and-standardrb.html)).

*   `bundle install`
    
*   `standardrb --fix` to automatically fix offences (_use this most of the time_)
    
*   `rubocop -a` RuboCop will try to [safely](https://docs.rubocop.org/rubocop/usage/auto_correct.html) automatically fix offences
    
*   `rubocop -A` to run all auto-corrections (safe and unsafe) (generally not recommended)
    

We also have the option of installing the [Annotate gem](https://github.com/ctran/annotate_models), the use of which is discussed [here.](https://satchel.works/@wclittle/full-stack-hello-world-tutorials-part-9)

### ESLint with Standard and Prettier (already added)

- [x] only one person needs to complete the following setup at the start of a project

#### Prettier

[Documentation](https://prettier.io/docs/en/index.html)

*   From your terminal `cd`, to the project’s root and run the following to install prettier:
    

```java
yarn add --dev --exact prettier
echo {}> .prettierrc.json
touch .prettierignore
```

*   Open up the “.prettierignore” file in VSCode and add the following to tell prettier to not reformat code there.
    

```java
tmp/
public/packs/
```

*   Run prettier with
    

`yarn prettier --write .`

#### ESLint

[Documentation](https://eslint.org/docs/latest/)

```java
yarn add --dev eslint-config-prettier
yarn add eslint --dev
yarn add babel-eslint --dev
yarn add eslint-plugin-react --dev
touch .eslintrc.json
```

*   Open up your .eslintrc.json file and add in:
    

```java
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
```

This sets up our ESLint config to let the linter know we are expecting our JavaScript to use modern conventions, and play nice with react and prettier. Save the file.

*   `touch .eslintignore`
    
*   Open the above file and add:
    

```java
tmp/
public/packs/
```

*   Save and run `yarn run eslint`
    

Finally, let’s go ahead and install the Prettier and ESLint extensions in our VSCode so they will run automatically when we write JavaScript and save files.

### VSCode

- [ ] [ESLint](https://marketplace.visualstudio.com/items?itemName=dbaeumer.vscode-eslint) helps you find and fix problems with your JavaScript code
- [ ] [Prettier](https://marketplace.visualstudio.com/items?itemName=esbenp.prettier-vscode) a tool that auto-rearranges your code
- [ ] [Headwind](https://marketplace.visualstudio.com/items?itemName=heybourn.headwind) parses your code and reprints class tags to follow a given order
- [ ] [Ruby](https://marketplace.visualstudio.com/items?itemName=rebornix.Ruby)

* * *

Complete Style Guides
---------------------

### JavaScript

[AirBnB’s JavaScript Style Guide](https://github.com/airbnb/javascript)

### Ruby

[AirBnB’s Ruby Style Guide](https://github.com/airbnb/ruby)

[GitHub’s Ruby Style Guide](https://github.com/github/rubocop-github/blob/main/STYLEGUIDE.md)

### Ruby on Rails

[Rubocop’s Rails Style Guide](https://github.com/rubocop/rails-style-guide)

### RSpec

[Better Spec’s RSpec Style Guide](https://www.betterspecs.org/)

[Rubocop’s RSpec Style Guide](https://github.com/rubocop/rspec-style-guide)

* * *

General
-------

### Commented out code

```js
// 🛑 Do not do this
function addToShoppingList(item) {  
  // console.log("Shopping list before", shoppingList);  
  // console.log("Adding item", item);  
  shoppingList.add(item);  
  // console.log("Shopping list after", shoppingList);
}
```

When you (or someone else) is reading your code, you want to see only what’s important. Removing commented out code helps find the relevant code faster and easier.

### Unused variables

```java
const orderTaxi = (pickUpTime) => {  
  let driverName = getDriverName();  
  let customerName = getCustomerName(); // 🛑 Don't do this!
  return `${driverName} will pick you up at ${pickUpTime}`;
}
```

Often when we refactor, some variables become _unused_. Don’t forget to remove them! Someone might come along, look at your code and assume it’s important.

### Indentation

Ensure your default tab size (indicated at the bottom right of your screen in VSCode) is set to **2**

### Good scoping of your variables

Define your variables with the narrowest scope they can have. For example:

```js
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
```

As your code becomes more complex it will be harder to keep track of what variable is used where.

```java
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
```

### Naming your variables and functions

When thinking about whether a variable name is good, try to imagine that you are reading the code again in the future and you have forgotten exactly how it works. Do the variable names help explain what the code is supposed to do?

#### Avoid short names

Very short variable names can be difficult to understand since the purpose of the variable can be unclear. They are also difficult to remember, especially if there are many similarly named variables. Try to avoid short names or abbreviations.

Here are some examples of **bad** names that you should avoid:

*   Single letters like `x` or `y`
    
*   Abbreviations like `evt` instead of `event`
    
*   Generic names like `array` or `string`
    

#### Describe what something is/does

A good variable name quickly explains what it represents to anyone reading the code.

```js
// 🛑 Try to avoid this
let song = true;

// ✅ This is better
let isPlaying = true;
```

The `isPlaying` variable name is better since it tells us whether a song is playing or not.

```js
// 🛑 Try to avoid this
const percentage = () => {
  // ...
}

// ✅ This is better
const getPercentage = () => {
  // ...
}
```

Here we should use the "get" verb to show that it returns something.

```java
// 🛑 Try to avoid this
const isOldEnough = (number) => {
  // ...
}

// ✅ This is better
const isOldEnough = (yearOfBirth) => {
  // ...
}
```

Parameters of functions should also have names that properly represent what is going to be received into the function.

### Avoid long functions[​](https://syllabus.codeyourfuture.io/guides/code-style-guide#avoid-long-functions)

Most of the time it is better to split a long function into a few shorter ones. This will:

1.  Make your code easier to read
    
2.  Make your code easier to maintain
    
3.  Make your code easier to review by out volunteers
    

Try to keep in mind that you will only ever write the code once, but you will read the code many times. Always aim to write code that is readable. See [The Art of Writing Small and Plain Functions](https://dmitripavlutin.com/the-art-of-writing-small-and-plain-functions/).

### Use Git rather than commenting out old code

And if you want something back, you can always look at the deleted code in the git history.

* * *

Tailwind
--------

### Mobile first

You should only ever be using `md` (for tablets) and `lg` (for desktops); styling without either is for mobile, which is what we should be developing for first. For example:

```java
class="text-sm md:text-lg lg:text-xl"
```

This means, for mobiles the text will be ‘small’, on tablets it’ll be ‘large’ and on desktops it’ll be ‘extra large’

### Headwind

Headwind works globally once installed and will run on save if a `tailwind.config.js` file is present within your working directory. Alternatively, you can trigger Headwind by:

*   Pressing CMD + Shift + T on Mac
    
*   Pressing CTRL + ALT + T on Windows
    

For customisation options, visit [here](https://marketplace.visualstudio.com/items?itemName=heybourn.headwind).

* * *

Git
---

### **Commit early, commit often**

To ensure more focused commits and a cleaner git history

### One Pull Request for one feature

* * *

JavaScript
----------

See [AirBnB’s JavaScript style guide](https://github.com/airbnb/javascript)

### Functions

#### Use ES6 Syntax

Rather than write it all out here, please visit [this](https://www.taniarascia.com/es6-syntax-and-feature-overview/) site for a fantastic overview.

### Naming conventions

*   Use `camelCase` for methods and variables.
    

### Variables

#### Use `const` over `let` and never `var`

```js
var myAge = 21; // 🛑 Do not use
let yourAge = 21; // ✅ Use for values that change
const secondsInMinute = 60; // ✅ Use for values that never change
```

Briefly, `let` can be updated but not re-declared. `const` cannot be updated or re-declared. Of the two, it is better to use `const` to avoid involuntary reassignments. More [info](https://www.freecodecamp.org/news/var-let-and-const-whats-the-difference/) and a [discussion](https://stackoverflow.com/questions/41086633/why-most-of-the-time-should-i-use-const-instead-of-let-in-javascript).

* * *

Ruby
----

See [GitHub’s](https://github.com/github/rubocop-github/blob/main/STYLEGUIDE.md) or [AirBnB’s](https://github.com/airbnb/ruby) style guide

### Naming conventions

*   Use `snake_case` for methods and variables.
    
*   Use `CamelCase` for classes and modules.
    
*   Use `SCREAMING_SNAKE_CASE` for other constants.
    

Rails
-----

See [Rubocop’s](https://github.com/rubocop/rails-style-guide) style guide

### Views

#### Use [partials](https://guides.rubyonrails.org/v3.2.9/layouts_and_rendering.html) to DRY up your views

Treat them as a way to move details out of a view so that you can grasp what’s going on more easily by having less code on any one page. For example, you might have a view that looked like this:

```ruby
<%= render "shared/ad_banner" %>
 
<h1>Products</h1>
 
<p>Here are a few of our fine products:</p>
...
 
<%= render "shared/footer" %>
```

Here, the `_ad_banner.html.erb` and `_footer.html.erb` partials contain content that is shared among many pages.

### Seeds

*   Use `puts` or `p` with interpolation before and after the creation of a new class.
    
*   If using .create, add `!` to the end; this will result in a meaningful alert if the class you’re trying to create isn’t valid. For example:
    

```java
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
```

### RSpec

incomplete

See [Better Specs](https://www.betterspecs.org/) or [Rubocop’s](https://github.com/rubocop/rspec-style-guide) style guide

#### Continuous Integration

incomplete

See [GitHub](https://docs.github.com/en/enterprise-server@3.4/actions/automating-builds-and-tests/building-and-testing-ruby) and [this](https://github.com/ruby/setup-ruby) for more detail

* * *

References
----------

*   [CodeYourFuture's Style Guide](https://syllabus.codeyourfuture.io/guides/code-style-guide#remember-your-audience)
    
*   [Setting Up ESLint](https://medium.com/nerd-for-tech/setting-up-eslint-with-standard-and-prettier-be245cb9fc64)
    
*   [Setting Up Rubocop](https://satchel.works/@wclittle/full-stack-hello-world-tutorials-part-9)
    
*   [StandardJS](https://standardjs.com/)
