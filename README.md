Rack::ProcessName
=================

Set the process name to what request is currently being processed. If you're
lucky and your OS shows process name changes, you'll see something like:

    15696 ttys001    0:07.04 script/rails S GET http://localhost:3000/servers/localhost/edit   

The letter before the request method means:

  * R - running
  * S - sleeping (last response was ok)
  * E - error (last response raised an exception)

Installation
============

In Rails, add to your Gemfile:

    gem 'rack-process-name'

then in application.rb or in one of config/environments/*.rb:

    config.middleware.use Rack::ProcessName

If using config.ru:

    require 'rack-process-name'
    use Rack::ProcessName
