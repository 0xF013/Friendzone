class LocationsController < ApplicationController

  def index
    @lat = params[:lat]
    @long = params[:long]
    @tweets = Twitter.search("", :count => 3, :geocode => "#{@lat},#{@long},10km", :result_type => "recent").results
  end

end