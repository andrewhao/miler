require 'dailymile'
require 'thor'
require 'pry'
require 'pry-byebug'
require 'awesome_print'

class Miler < Thor
  desc 'download USERNAME', "Download GPX for USERNAME"
  def download(username)
    binding.pry
    res = client.get "/people/#{username}/routes", since: DateTime.new(2015, 01, 01).to_time.to_i
    ap res
  end

  desc 'gpx ROUTEID', "Download route ROUTEID"
  def gpx(route_id)
    gpx = client.get "/routes/#{route_id}.gpx"
    binding.pry
    puts gpx
  end

  private

  def client
    @client ||= begin
                  Dailymile::Client.set_client_credentials ENV['DM_CLIENT_ID'], ENV['DM_CLIENT_SECRET']
                  Dailymile::Client.new ENV['DM_DEV_ACCESS_TOKEN']
                end
  end
end

Miler.start(ARGV)
