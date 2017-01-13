# README

Small application to execute  background jobs when export a list of users to csv file and import data from CSV file. Too a liitle demostration about WebSockets using ActionCable.
### Topics
 - Executes a job when a user export data to csv file and create a message
 - Executes a job when a user import data from csv file and create a log with the status of the task
 - Uses WebSockets to see the messages or send messages between users or subscriptions.

* Ruby version 2.2.6
* Rails version 5.0.1

 ## Prerequisites:
 - Installed Redis server
 
 ## Installing Redis

 ### On linux
  ```sh
   wget http://download.redis.io/redis-stable.tar.gz
   tar xvzf redis-stable.tar.gz
   cd redis-stable
   make
   make install
  ```

 ### On Mac
 ```sh
brew install redis
```



 To start the application:

  Go to the root path of the project and execute the next commands
  ```sh
   $ bundle install
   $ rails db:create
   $ rails db:migrate
   ```
   You need to run the jobs
   ```sh
    foreman start  
   ```
   Open a new console and execute
   ```sh
    rails server
   ```
You can see a demo  http://screencast.com/t/JHVEOb0LJik

## References
- https://www.youtube.com/watch?v=n0WUjGkDFS0
- http://edgeguides.rubyonrails.org/action_cable_overview.html
- http://www.thegreatcodeadventure.com/rails-5-preview-action-cable/
- https://github.com/rails/actioncable-examples
- https://www.sitepoint.com/action-cable-and-websockets-an-in-depth-tutorial/
- https://www.pluralsight.com/guides/ruby-ruby-on-rails/creating-a-chat-using-rails-action-cable