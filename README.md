# Lighthouse Labs Bootcamp

# W7D2 Breakout - Active Record

## To start Sinatra

1.  `bundle install`
2.  `shotgun -p 3000 -o 0.0.0.0`
3.  Visit `http://localhost:3000/` in your browser

- To play around with the models, type `tux` in your terminal
- You can run migrations with `rake db:migrate`

## Players ERD

We need to create the database tables according to this ERD:

![Players ERD](./screenshots/players_erd.png?raw=true 'Players ERD')

## Migrations

[Active Record Migrations](http://guides.rubyonrails.org/active_record_migrations.html)

### Create a migration file

- **With Sinatra:**
  `rake db:create_migration NAME=migration_name`

- **With Rails:**
  `bin/rails g migration migration_name field1:type field2:type`

- Make sure the version number shows up in the migration
- No need to create up and down versions. Active Record knows how to rollback

**Rake is the task runner used by Rails**

### Running Migrations

`rake db:migrate`

- ActiveRecord will update schema.rb automatically. No need to touch this file.

### Role Back Migrations

`rake db:rollback`

## Validations

[Active Record Validations](http://guides.rubyonrails.org/active_record_validations.html)

### built-in validations

- presence
- uniqueness
- numericality
- length

- regular expression for email validation:

  /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

### Test the validity

#### What triggers validations?

- create
- save
- update

**.valid?**
=> test if anything is added to the errors hash
=> If the error hash is empty, than it is a valid object

`object.errors.full_messages.each{ |msg| puts msg }`

### Custom validations

** validate instead of validates **

- You need to create your own method
- The method will add an error to the error hash if something is not valid

`errors.add(:error_name, "error message)`

[Active Record Errors Doc](http://guides.rubyonrails.org/active_record_validations.html#working-with-validation-errors)

## Callbacks

[Active Record Callbacks](http://guides.rubyonrails.org/active_record_callbacks.html)

- You need to register callbacks in the models

callbacks are available when:

1.  Creating an object
2.  Updating an object
3.  Destroying an object
