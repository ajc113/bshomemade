# Bs'Homemade

# Setting Up Your Development Environment

## Ruby Version & Gem Installation

Please ensure that you have the Ruby version (3.1.2) indicated inside .ruby-version configured for the project's directory. 
It's recommended that you use a version manager like rbenv, rvm for this.

Make sure you have the bundler gem installed, before moving on and then run `bundle install` to conclude this step.

## Node version & packages installation

Use Node version `v16.18.1` - same as Heroku. And fire `npm i` or `yarn` based on the package manager you are using.

## Database Setup

Open up `config/database.yml` and check the database name under `development` and `test`.

If your PostgreSQL is configured to use default user roles, the setup should work without any changes. You can try 
this by running `psql` in your terminal to see if it connects without any extra params.

In this case, simply proceed by running

```
rails db:create
rails db:schema:migrate
```

and you are good to go.

If you change the `database.yml`, please do not commit that and keep it as a local change only.

## Credentials

We are using [Rails credentials](https://edgeguides.rubyonrails.org/security.html#custom-credentials). Fire the following command to know more:
```ruby
bin/rails credentials:help
```

The code need to have the following keys in place to run without errors:

```
config/master.key
config/credentials/production.key
```

The `master.key` is used by default. The `production.key` is used for the production environment or any time the `RAILS_ENV` is set to `PRODUCTION`.

### Edit credentials
If you want to edit Rails credentials, simply proceed by running

```
EDITOR=vim rails credentials:edit
```
For production

```
EDITOR=vim rails credentials:edit -e production
```

or you can use editor of your choice.

Finally, try `rails c` to start the console to check if it opens up without any errors.

## Running the code locally

 - Delete the node_modules folder if exists.
 - Fire yarn or npm i  to install Node packages
 - Run bin/rails assets:clobber to remove stale assets
 - Run bin/dev to start the server
 - Access the site on http://localhost:3000
