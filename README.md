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