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

  [RVM]: https://rvm.io/

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

### Cucumber

In order to describe features, add Cucumber to the `Gemfile`:

    group :test do
      gem 'cucumber-rails', :require => false
      # database_cleaner is not required, but highly recommended
      gem 'database_cleaner'
    end

Then run:

    bundle install
    rails generate cucumber:install

### Optional: Speed Tests with Spork

To avoid loading the test environment for each test, using Spork is recomended. It can be used in combination with Guard, which runs automatically the test suite when files are modified.

    # Gemfile

    group :test do
      gem 'spork'
    end

Then run:

    spork --bootstrap
    # Use `bundle exec sprok --bootstap` with RVM older than 1.11

Finally, edit the `spec/spec_helper.rb`. The file is self-documented. (You can safely put all the commands into the `Spork.prefork` block.)

You can now run Spork in a new terminal:

    spork
    # Use `bundle exec spork` with RVM older than 1.11
    Using RSpec...

#### Integrate RSpec with Spork

When you run `spork`, a test environment is created for the RSpec specs to be ran. To ensure RSpec makes use of that environment, add the `--drb` option to the `.rspec` file.

#### Integrate Cucumber with Spork

The `cucumber-rails` gem installation script provides an option to integrate Cucumber with Spork. (See `rails generate cucumber:install --help`.)

    rails generate cucumber:install --spork

    # Add the `--drb` option to some commands, you should allow overwritting.
    conflict  config/cucumber.yml
    Overwrite /path/to/kata-phonebook/config/cucumber.yml? (enter "h" for help) [Ynaqdh] y
            force  config/cucumber.yml
        identical  script/cucumber
            chmod  script/cucumber
            exist  features/step_definitions
            exist  features/support

    # Modify the Cucumber enviroment to use Spork, you should allow overwritting.
         conflict  features/support/env.rb
    Overwrite /path/to/kata-phonebook/features/support/env.rb? (enter "h" for help) [Ynaqdh] y
           force  features/support/env.rb
           exist  lib/tasks
        identical  lib/tasks/cucumber.rake

The environment used to run Cucumber features is different from the one used by RSpec specs. Open a new terminal and run:

    spork cucumber
    Using Cucumber...

You can run both Cucumber and RSpec with a single command: `rake`.

### Optional: Automate Tests with Guard

The `guard-spork` gem provides Guard-Spork integration. Add it to the `Gemfile` with the gems that provide notifications for your operating system:

    group :test do
      gem 'guard-spork'

      # Notifications gems to be used with Guard
      # See http://ruby.railstutorial.org/chapters/static-pages#sec-guard

      # Notifications gems on Linux
      gem 'rb-inotify', '0.8.8'
      gem 'libnotify', '0.5.9' 

      # Notifications gems on Macintosh OS X
      #gem 'rb-fsevent', '0.9.1', :require => false
      #gem 'growl', '1.0.3' 

      # Notifications gems on Windows
      #gem 'rb-fchange', '0.0.5'
      #gem 'rb-notifu', '0.0.4'
      #gem 'win32console', '1.3.0'
    end

Then run:

    bundle install
    guard init spork

Finally, you can now start Guard which will automatically launch Spork (and you can close the terminals in which you used to launch Spork manually!):

    guard --no-bundler-warning
    # Use `bundle exec guard` with RVM older than 1.11

    Guard uses NotifySend to send notifications.
    Guard is now watching at '/path/to/kata-phonebook'
    Starting Spork for RSpec, Cucumber
    Using RSpec
    Preloading Rails environment
    Using Cucumber
    Preloading Rails environment
    Loading Spork.prefork block...
    Loading Spork.prefork block...
    Spork is ready and listening on 8989!
    Spork is ready and listening on 8990!
    Spork server for RSpec, Cucumber successfully started
    > 

#### Note on the Guardfile

The generated `Guardfile` is just fine to ensure RSpec and Cucumber will use the Spork server because both are already configured to use their `--drb` options. (Specifically, it is **not** necessary to repeat that in this `Guardfile` as described in the Guard `README`.)

    # A Guardfile
    # More info at https://github.com/guard/guard#readme

    guard 'spork', :cucumber_env => { 'RAILS_ENV' => 'test' }, :rspec_env => { 'RAILS_ENV' => 'test' } do
      watch('config/application.rb')
      watch('config/environment.rb')
      watch('config/environments/test.rb')
      watch(%r{^config/initializers/.+\.rb$})
      watch('Gemfile')
      watch('Gemfile.lock')
      watch('spec/spec_helper.rb') { :rspec }
      watch('test/test_helper.rb') { :test_unit }
      watch(%r{features/support/}) { :cucumber }
    end

    # It should not be necessary to pass the `--drb` option to RSpec and Cucumber here
    # since it is already passed through `.rspec` and `config/cucumber.yaml`.

Getting Started!
----------------

### Repository Conventions

In order to keep the _kata_ readable, I find the following rules helpful.

#### Features Branches

A new branch should be created for each new feature, and it should deliver only one feature.
Changes should be committed each time a scenario becomes green, or each time something has been successfully refactored.

Once refactored, the branch should be merged back using `git merge --no-ff feature-manage-contacts` in order to keep them visible with `git log --graph`.

#### Refactoring

Refactoring should always be performed in the green and committed separately.

That's all folks!