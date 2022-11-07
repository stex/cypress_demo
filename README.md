![cypress-on-rails](https://user-images.githubusercontent.com/27221/200412448-ba1ffbf3-90b1-4fcf-9381-73ab519be235.png)

# Cypress on Rails Demo

This repo contains a demo application with examples on how to use 
the [`cypress-on-rails`](https://github.com/shakacode/cypress-on-rails) gem
and a corresponding presentation.

## Commands

Run Cypress Tests

    $> RAILS_ENV=test bin/rails s
    $> yarn --cwd cypress run cypress open

Run Capybara Tests
    $> RAILS_ENV=test bin/rails test test/system
