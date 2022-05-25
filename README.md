# README

This part of the interview process allows us to learn more about your software engineering and web development skills. Below is a description of a CRUD API that manages products, keeps track of their pricing and their view counts. You are given a boilerplate application with parts that are incomplete or not working as expected. The task is to add features to the application, adapt some parts of it and come prepared at the next interview with suggestions on how to improve it.

The boilerplate application has some basic components set up: a Product model with a database connection and an empty controller. We would like you to add the following:
•	An API to get a single product
•	Finish the implementation for fetching the currency conversion

When a single product is requested, all fields of that product are returned and the view-count for that product is incremented. The request can optionally specify a currency, in which case the price should be converted to the requested currency before being returned. We need to support the following currencies:
*	USD
*	CAD
*	EUR
*	GBP

The latest exchange rates are retrieved from the public API https://currencylayer.com/. Tests are optional but we would like to hear from you how would you design such tests at the interview.

Getting Started
================================

Welcome to Boilerplate. We assume you're a new developer looking to getting
started.

Setup
-------------------

Fork the Boilerplate repository to your own account by clicking "Fork" up in the top right of this screen.

Check out the source code. Your choice whether to have `origin` or your own fork as `origin` - either:

    cd ~/workspace
    git clone git@github.com:YOUR_USERNAME/boilerplate-rails.git
    cd boilerplate-rails
    git remote add upstream git@github.com:kozmasz/boilerplate-rails.git
    
Install the gems

    bundle install
    
## Install Xcode Command Line Tools

I use Homebrew, which requires Xcode Command Line tools for building packages. There are two ways to get Xcode command line tools:
 
1. Download the command line tools from https://developer.apple.com/downloads/index.action (requires an apple developer ID).

2. Install the command line tools from Xcode from Preferences -> Locations -> Command Line Tools.

or

* Find it in the Apple's app store.

If you are using Xcode 4.3+, don't forget to install the command line tools (Preferences -> Locations -> Command Line Tools).

## Install Homebrew

`\ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"`

## Install MySQL

If you use MacOS Catalina or newer operating system then:

```shell
brew install mysql@5.7
echo 'export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"' >> ~/.zshrc
source ~/.zshrc
```

Otherwise:

```shell
brew install mysql56
```

## Set `config/database.yml like this

I used MySql for this task, but you can easily change to Postgres as well.
````

development: &defaults
  adapter: mysql2
  encoding: utf8
  reconnect: false
  database: boilerplate_development
  pool: 5
  username: root
  password:
  socket: /tmp/mysql.sock
test:
  <<: *defaults
  database: boilerplate_development_test
production:
  <<: *defaults
  database: boilerplate_development_prod
  
  ````
  


## After these settings

`bundle exec rails db:create`\
`bundle exec rails db:migrate`


## Getting all currency

Open a Rails console and type `Product.list` or type in to the browser the following url `http://localhost:3000/products`

