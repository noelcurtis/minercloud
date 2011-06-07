== Minercloud.com

Front-end to a pushpool server. It is responsible for allowing users to create accounts, create workers and keeping track of how many bitcoins each worker has mined.


=== Getting started

  * Install Ruby 1.9.2, MySQL 5.x
  * Clone git project
  * cd into the project directory
  * cp config/example-database.yml config/database.yml
  * edit config/database.yml to your settings
  * run the following commands
  * bundle install
  * rake db:create
  * rake db:migrate
  * rails s
  * point your web browser to http://localhost:3000 and you should see minercloud