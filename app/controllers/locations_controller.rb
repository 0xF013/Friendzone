require 'net/http'

class LocationsController < ApplicationController

  def index
    @lat = params[:lat]
    @long = params[:long]
    @tweets = Twitter.search("", 
      #:count => 5, 
      :geocode => "#{@lat},#{@long},10km", 
      :result_type => "recent").results.first(30)#.reject{|t| t.attrs[:coordinates].nil?}.first(5)


    # @tweet_embeds = {}

    # @tweets.each do |t| 
    #   url = URI.parse("http://api.twitter.com/1/statuses/oembed.json?id=#{t.id}")
    #   req = Net::HTTP::Get.new(url.path)
    #   res = Net::HTTP.start(url.host, url.port) {|http|
    #     http.request(req)
    #   }
    #   @tweet_embeds[t.id] = JSON.parse(res.body)["html"]
    # end


    panoramio = PanoramioRb.get_panoramas_from_point([@lat.to_f, @long.to_f])
    @panorams = panoramio.photos.first(30)

    @instagrams = Instagram.media_search(@lat, @long, :distance => 5000).first(30)

  end

end