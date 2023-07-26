# Transeasy
> A basic translation manager for a single application

## Setup

Add the gem to your Gemfile

```ruby
### Gemfile
gem "transeasy", git: "https://github.com/RoccoKing98/transeasy"
```

Then install and execute the database migrations

```sh
bundle install
bundle exec rake transeasy:install:migrations
bundle exec rake db:migrate
```

## Routing

Mount the engine as a sub-path in your application, changing the target as desired.

```ruby
### config/routes.rb

mount Transeasy::Engine, at: "/transeasy", as: "transeasy"
```
