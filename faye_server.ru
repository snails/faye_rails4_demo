#usage: rackup faye_server.ru -s thin [-E production]
require 'faye'
require 'yaml'

main_config = YAML.load_file("config/settings.yml")[ENV['RACK_ENV']]
FAYE_TOKEN = main_config["faye"]["AUTH_TOKEN"]

class FayeServer
  def incoming(message, callback)
    if message['channel'] !~ %r{^/meta/}
      if message['auth_token'] != FAYE_TOKEN
        message['error'] = 'Invalid authentication token'
      else
        message.delete('auth_token')
      end
    end
    callback.call(message)
  end
end

faye_server = Faye::RackAdapter.new(:mount => '/faye', :timeout => 25)
faye_server.add_extension(FayeServer.new)
run faye_server
