class LocationsController < ApplicationController

  def index
    @lat = params[:lat]
    @long = params[:long]
    @tweets = Twitter.search("", 
      :count => 5, 
      :geocode => "#{@lat},#{@long},10km", 
      :result_type => "recent").results

    panoramio = PanoramioRb.get_panoramas_from_point([@lat.to_f, @long.to_f])
    @panorams = panoramio.photos

    @instagrams = Instagram.media_search(@lat, @long, :distance => 5000)

  end

end