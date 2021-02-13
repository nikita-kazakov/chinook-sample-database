# Chinook Music Dataset in Ruby on Rails 5

## What is it?
Chinook is an open-source sample database that represents a digital media store. It's for use in demos or for learning how to use a specific web framework without needing to make data up. 


## Database
The repo runs on Postgresql. However, since Ruby on Rails handles importing data through `seeds.rb`, you should be able to run this repo any Ruby on Rails supported database. See `app/config/database.yml` for Rails database setup.


## Getting Started

Install Postgresql on your machine.

Clone the chinook repository:
`git clone https://github.com/nikita-kazakov/chinook`

Change terminal directory to chinook:
`cd chinook`

Run Rails migration to create database tables:
`rails db:migrate`

Run seeds.db to populate database tables:
`rails db:seed`

Run rails server:
`rails server`