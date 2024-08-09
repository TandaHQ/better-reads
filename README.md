# README

## What is this?
This is a simple code base to be used in interviews at Tanda. It’s a basic Rails (7.1) App that allows people to create reviews for books.

# Getting Started
To get started with BetterReads - run the following commands.

## Using Docker

Download and install Docker following this guide: https://docs.docker.com/guides/getting-started/get-docker-desktop/

Once you have downloaded docker run the following to set up the container

```bash
# build the application docker image
docker compose build

# Verify the image built
docker images | grep better_reads

# Run the application
docker compose up

# Alternatively if you prefer to skip compose and use direct docker commands

docker build -t better_reads .
# Verify the image built
docker images | grep better_reads

# Run the application
docker run --rm -it \
  -p 3000:3000 \
  -v .:/rails better_reads

# In another terminal
docker run --rm -it \
  -v .:/rails better_reads tailwind
```

Some other commands useful for local development with Docker via the compose plugin

```bash
# Access the Rails console
docker compose run --rm better_reads console

# Launch a shell in a new container
docker compose run --rm better_reads bash

# Launch a shell in the running container previously launched using `docker compose up`
docker compose exec better_reads bash

# Alternatively if you prefer to skip compose and use direct docker commands

# Access the Rails console
docker run --rm -it -v .:/rails better_reads console

# To access the Docker image CLI
docker run -it --entrypoint /bin/bash better_reads

# To access the currently running container CLI
docker ps

# From the command above find the running Container ID for better_reads
docker exec -it <CONTAINER_ID> bash
```

## Without Docker

You will need to install `sqlite` and `ruby`. You can follow the official Ruby on Rails guide here: https://guides.rubyonrails.org/getting_started.html#creating-a-new-rails-project-installing-rails


### After system dependencies are installed

```bash
# This will install dependencies
bundle install

# This will setup the database & seed it
bin/rails db:prepare

# In one terminal run this - it will run a watcher for tailwind
bin/dev

# In another terminal run this - it will run the rails server
bin/rails server
```

## After Setup
Visit `localhost:3000` and login with either user found in `seeds.rb`.

## Run the test suite

### Using docker
```bash
# get a container shell first
docker compose run --rm better_reads bash
```

```bash
# Using Rake
bundle exec rake test

# Alternatively either of these work too
bin/test

bin/rails test

# To run a specific suite
bin/rails test test/controllers/books_controller_test.rb

# To run a test on a specific line
bin/rails test test/controllers/books_controller_test.rb:11
```

## Debugging

You can add `binding.pry` to any Ruby file or view to access the debugger. This will add a breakpoint in your terminal window to use for any debugging. If you have never used a Ruby debugger before, this article should help get you started: https://medium.com/@eddgr/the-absolute-beginners-guide-to-using-pry-in-ruby-b08681558fa6

If you are using docker to run the application you'll need to make sure docker attaches to the running container to open an interactive debugging shell.

After you've started the application using `docker compose up` you'll need to open a new shell in the same directory and run `docker attach $(docker compose ps -q better_reads)`.

From there you'll be attached to the application container and any active breakpoints will trigger in this attached shell env.
