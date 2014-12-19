== README

#HowTo

There are two references you can refer. One is from [Ryan](http://railscasts.com/episodes/260-messaging-with-faye?autoplay=true), and the other is from [Ruby-china](http://github.com/ruby-china/ruby-china).

#How to run the app demo

1. run `bundle exec bundle install` and `rake db:migrate`.
2. run the faye server, ie: `rackup faye_server.ru -s thin -E production`.
3. Just run the rails app. U will see that it can share messages in different browser.

Enjoy!

