class Like < ActiveRecord::Base
  attr_accessible :content, :item_id, :item_type
  serialize :content
  belongs_to :user
end
