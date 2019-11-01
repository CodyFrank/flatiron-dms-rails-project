# Flatiron DMS

A DMS made with Ruby on Rails that allows users to moniter all needed steps of vehicle repairs.
Users can expect to 

* generate repair orders 
* track repair orders
* track work flow in a shop

*note* this application is designed for both employees of a vehicle repair facility and customers of a repair facility

## Deployment
This application is currently not deployed and no plans for employement currently exist

## Usage
1. To use this application fork and clone the repo from Github
2. Run bundle install
3. Run migrations (rake db:migrate)
4. Seed the database (rake db:seed)
5. Have fun!
*note There will be an admin employee already created to sign in use worker number 1234 and the password is password"

## Built with
* Ruby on Rails
* Sqlite3 database (ActiveRecord) 
* Omniauth / Omniauth-Facebook (Facebook Login)
* Dotenv - rails (Environment Variable Management)
* bcrypt ( Hashing and Salting Password)



