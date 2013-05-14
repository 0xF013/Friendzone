require 'net/http'
#require 'open-uri'
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
    response = Net::HTTP.get_response("maps.googleapis.com","/maps/api/geocode/json?latlng=#{@lat},#{@long}&sensor=false&language=ru")

    json = JSON.parse(response.body)
    puts "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++="
    puts json.inspect
    name = json["results"].first["formatted_address"]
    @place = current_user.places.find_by_name(name)
    unless @place
      @place = current_user.places.create :name => name, :latitude => @lat, :longitude => @long
    end
  end


  def list
    @places = current_user.places
  end

  def likes
    @likes = current_user.likes
  end

  def like
    type = params[:type]
    id = params[:id]    
    content = params[:content]

    like = current_user.likes.find_by_item_id_and_item_type(id, type)
    unless like
      current_user.likes.create :item_id => id, :item_type => type, :content => content
    end

    render :json => {status: "ok"}

  end

  # def like
  #   @type = params[:type]
  #   @id = params[:id]

  #   case @type

  #     when "twitter"
  #       item = Twitter.status(@id)
  #     when "panoramio"
  #       item = PanoramioRb

  # end
  # Like.create :id => @id, :type => @type, :content => item

end