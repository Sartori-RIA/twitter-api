# Sartori Twitter api

[![Build Status](https://travis-ci.com/Sartori-RIA/twitter-api.svg?branch=master)](https://travis-ci.com/Sartori-RIA/twitter-api)
[![Maintainability](https://api.codeclimate.com/v1/badges/a50f8b263360a0f4c1c1/maintainability)](https://codeclimate.com/github/Sartori-RIA/twitter-api/maintainability)
[![Test Coverage](https://api.codeclimate.com/v1/badges/a50f8b263360a0f4c1c1/test_coverage)](https://codeclimate.com/github/Sartori-RIA/twitter-api/test_coverage)

# Requirements

+ With docker
    + Docker
    + Docker Compose

+ Without docker
    + Ruby 2.7.2
    + Rails 6
    + Bundler
    
# Quick start

+ `cp config/application.yml.example config/application.yml`  
    + if you going to run this project inside docker, please change:
        ````yaml
        database: &database
            db.username: postgres
            db.password: postgres
            db.host: localhost  
      ````
    
      to:
    
      ````yaml
      database: &database
        db.username: postgres
        db.password: postgres
        db.host: db
      
 + With docker
    + `docker-compose up -d`
    + `docker exec it twitter_api /bin/bash`
    + `bundle`
    + `rails db:create`
    + `rails db:migrate`
    + `rails db:populate`
    + `rails s`, open in `http://localhost`
    + to run spec tests: `rspec`
    
+ Without docker
    + `bundle`
    + `rails db:create`
    + `rails db:migrate`
    + `rails db:populate`
    + `rails s`, open in `http://localhost:3000`
    + to run spec tests: `rspec`