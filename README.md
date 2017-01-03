# README

Small application to execute a background job when export a list of users to csv file

* Ruby version 2.2.6

* Rails version 5.0.1

 Prerequisites:
 - Installed and running Redis server

 To start the application:

  Go to the root path of the project and execute the next commands
   - bundle install
   - rake db:create
   - rake db:migrate
   - foreman start  
   	  - Here you can view jobs running

   Open a new console and execute
   - rails server

You can see a demo  http://screencast.com/t/JHVEOb0LJik