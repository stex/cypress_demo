# README

This is a demo application accompanying a short talk about one way to use
cypress with a Ruby on Rails application and comparing it to capybara.

The slides can be found here: https://stex.codes/programming/2020/12/09/cypress-on-rails-talk.html

## Usage

### Rails Application

If you just want to try out the Rails application, just install the dependencies, setup the database and start the server in development mode:

```bash
bundle install
yarn install

rake db:setup
rails s
```

The seed users have email addresses in the format `user_N@example.com` with the password `12345678`.

### Capybara Tests

The capybara tests are ran using RSpec:

```bash
rspec spec/features
```

You might have to set up the test database first:

```bash
rake db:test:prepare
```

### Cypress Tests

To run the cypress tests, you need both a Rails server in `test` environment and the actual cypress runner. I created helper scripts in the project's `package.json` to make this a bit easier:

```bash
yarn cypress:rails
yarn cypress:open
```
