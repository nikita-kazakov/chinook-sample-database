# Chinook Music Dataset in Ruby on Rails

## What is it?
Chinook is an open-source sample database that represents a digital media store. It's for use in demos or for learning how to use a specific web framework without needing to make data up. 

## ERD Diagram
Here is the [entity relationship diagram](https://dbdiagram.io/d/5daf54c802e6e93440f28407) (ERD) for this project.
![Chinook ERD](https://github.com/nikita-kazakov/chinook-sample-database/blob/main/app/assets/images/chinook_erd.png?raw=true)
## Versions
- Ruby on Rails 5.2
- Ruby 2.5.5

## Database
The repo runs on Postgresql. However, since Ruby on Rails handles importing data through `seeds.rb`, you should be able to run this repo any Ruby on Rails supported database. See `app/config/database.yml` for Rails database setup.

## Getting Started

Install Postgresql on your machine.

Clone the chinook repository:
`git clone https://github.com/nikita-kazakov/chinook-sample-database`

Change terminal directory to chinook:
`cd chinook`

Create database tables:
`rails db:create`

Run Rails migration to create database tables:
`rails db:migrate`

Run seeds.db to populate database tables:
`rails db:seed`

Run rails server:
`rails server`
