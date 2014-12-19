module ApplicationHelper
  def broadcast(channel, &block)
    message = {channel: channel, data: capture(&block)}
    message.merge!({auth_token: Settings.faye.AUTH_TOKEN})
    puts "The params is #{message}"
    uri = URI.parse(Settings.faye.server)
    Net::HTTP.post_form(uri, message: message.to_json)
  end
end
