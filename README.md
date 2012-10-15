Phonebook Kata
==============

This _kata_ aims at applying the <abbr title="Behaviour-Driven Development">BDD</abbr> principles to build a phone book with Ruby on Rails, Cucumber and RSpec.

Phonebook is a single-user application (without login) for keeping track of the people you work with.

Environment Setup
-----------------

### RVM

I use [RVM][RVM] to keep _kata_ environments separated from each others. In my opinion the easiest way to use it is setting a project `.rvmrc` file in the project directory.

    cd kata-phonebook
    rvm --rvmrc --create 1.9.3-head@kata-phonebook
    # Keep the file ignored by version control
    echo ".rvmrc" >> .gitignore

### Rails

Provided you install Rails from the `kata-phonebook` directory, it will be added to your _gemset_ without messing your system Ruby installation.

    cd kata-phonebook
    gem install rails
    Fetching: rails-3.2.8.gem (100%)
    ...
    29 gems installed

Let's now create a new app. Since we will use RSpec for testing, we use the `--skip-test-unit` option to tell Rails not to generate a `test` directory associated with the default `Test::Unit` framework.

    cd kata-phonebook
    rails new phonebook --skip-test-unit

#### Note on ExecJS

>If your system complains about the lack of a JavaScript runtime, visit the [execjs page at GitHub][execjs] for a list of possibilities. I particularly recommend installing [Node.js][node.js].

> -- [Michael Hartl][RoR Tutorial]

  [execjs]: https://github.com/sstephenson/execjs
  [node.js]: http://nodejs.org/
  [RoR Tutorial]: http://ruby.railstutorial.org/chapters/static-pages

### Bundler

Bundler is installed automatically by the `rails` command.

### Heroku

Heroku mades easy deploying through a single `git push heroku master`.

    cd kata-phonebook
    heroku create
    Creating some-funny-name-2564... done, stack is cedar
    http://some-funny-name-2564.herokuapp.com/ | git@heroku.com:some-funny-name-2564.git
    Git remote heroku added

In order to allow Heroku to use PostgreSQL in the production environment, modify the section related to SQLite in the `Gemfile`.

    # Gems used only for development and test
    # Insulating 'sqlite3' from :production is required
    # to allow deployment to Heroku
    group :development, :test do
      gem 'sqlite3'
    end

Behaviour-Driven Development Tools Setup
----------------------------------------

### RSpec

In order to write integration tests, add RSpec and Capybara to the `Gemfile`:

    group :development, :test do
      gem 'rspec-rails'
    end

    # Capybara is not required but improves the specs readability.
    group :test do
      gem 'capybara'
    end

Then run:

    bundle install
    rails generate rspec:install