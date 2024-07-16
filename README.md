# README

## What is this?
This is a simple code base to be used in interviews at Tanda. It’s a basic Rails (7.1) App that allows people to create reviews for books.


# Getting Started
To get started with BetterReads - run the following commands. You might also need to install `sqlite` and `ruby`. You can follow the official Ruby on Rails guide here: https://guides.rubyonrails.org/getting_started.html#creating-a-new-rails-project-installing-rails

```bash
# This will install dependencies
bundle install

# This will setup the database & seed it
bin/rails db:setup

# In one terminal run this - it will run a watcher for tailwind
bin/dev

# In another terminal run this - it will run the rails server
bin/rails server
```

Then visit `localhost:3000` and login with either user found in `seeds.rb`.

To run the test suite
----
```bash
bundle exec rake test

# Alternatively
bin/test
```


