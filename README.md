# Jungle

A mini e-commerce application built with Rails 6.1 for purposes of teaching Rails by example. Users can register an account, browse existing products and purchase them. Administrators have access to add new products and categories.

## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rails db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Database

If Rails is complaining about authentication to the database, uncomment the user and password fields from `config/database.yml` in the development and test sections, and replace if necessary the user and password `development` to an existing database user.

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

- Rails 6.1 [Rails Guide](http://guides.rubyonrails.org/v6.1/)
- Bootstrap 5
- PostgreSQL 9.x
- Stripe
- bcrypt
- cypress 9.x

## Features

## Registration

Users can register for a new account using their first name, last name, email address, and a password. Registration is not required to purchase items as a guest.

## Login

Using bcrypt encrypted authentication, users can login with their email address and password.

## Main Page

The home landing page has all products from all categories on it. A user man select a product in order to navigate to that product's page, where more details are visible. A user can add an item to cart from the home page and the product page.

## Browsing Categories

The navigation bar has options to browse categories and view all plants in a specific category. Users can also log in or out, or register for a new account in the nav bar. Admin users can access the Admin drop down in order to add new poroducts or categories, or manage inventory.

## Adding to Cart

A user can click the "Add" button to place an item in the shopping cart.

## Administrative Page

Using the administrative page, an administrator can view all inventory and manage products, as well as add new categories.

