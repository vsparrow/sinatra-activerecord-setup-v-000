First, we'll add three gems to allow us to use ActiveRecord:
activerecord version 4.2.5, sinatra-activerecord, and rake.
activerecord gives us access to the magical database mapping and association powers.
rake, short for "ruby make", is a package that lets us quickly create files, folders, and automate tasks such as
  database creation,
sinatra-activerecord gives us access to some awesome Rake tasks.
Make sure those three gems are in your Gemfile:


Into our development group, we'll add two other gems:
sqlite3 and tux.
sqlite3 is our database adapter gem - it's what allows our Ruby application to communicate with a SQL database.
tux will give us an interactive console that pre-loads our database and ActiveRecord relationships for us.
Since we won't use either of these in production, we put them in our :development group
#Gemfile
gem 'sinatra'
gem 'activerecord', '4.2.5'
gem 'sinatra-activerecord'
gem 'thin'
gem 'require_all'
group :development do
  gem 'shotgun'
  gem 'pry'
  gem 'tux'
  gem 'sqlite3'
end
# end Gemfile

we still need to setup a connection to our database.
Add the following block of code to your environment.rb file (underneath Bundler.require(:default, ENV['SINATRA_ENV'])).
configure :development do
  set :database, 'sqlite3:db/database.db' #or change to 'sqlite3:db/dogs.db' # for a dogs database
end #This sets up a connection to a sqlite3 database named "database.db", located in a folder called "db.


Rakefile
In the Rakefile, we'll require our config/environment.rb file to load up our environment,
as well as "sinatra/activerecord/rake" to get Rake tasks from the sinatra-activerecord gem.
require './config/environment'
require 'sinatra/activerecord/rake' #this will give you tasks that come from Rake -T

create migration:
rake db:create_migration NAME=create_dogs  #now do AR stuff like add def change and create_table
rake db:migrate
