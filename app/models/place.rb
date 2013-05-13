class Place < ActiveRecord::Base
  belongs_to :user
  attr_accessible :latitude, :longitude, :name
end
