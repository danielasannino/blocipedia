# README

# Blocipedia

Blocipedia is a Ruby on Rails application that allows users to create wikis and collaborate on other wikis. Users can pay to upgrade their membership, allowing them to view and create private wikis.

# Features

 Users can create a standard account in order to create, edit, and collaborate on public wikis using Markdown syntax. Anyone can view public wikis.
 Users can pay to upgrade their account to Premium in order to view and create private wikis.
 Premium users can allow others to view and collaborate on the private wikis they create.
 Premium users can downgrade their account back to Standard.
 When a user downgrades his or her account, his or her private wikis will automatically become public.

# Setup and Configuration

**Languages and Frameworks**: Ruby on Rails and Bootstrap

**Development Tools and Gems include**:

 Devise for user authentication
 SendGrid for email confirmation
 Redcarpet for Markdown formatting
 Pundit for authorization
 Stripe for payments

**Setup:**

**To run Blocipedia locally:**

 Clone the repository
 Run bundle install
 Create and migrate the SQLite database with `rake db:create` and `rake db:migrate`
 Start the server using `rails server`
 Run the app on `localhost:3000`

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
