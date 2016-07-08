class Tag < ActiveRecord::Base
  validates_presence_of :name
  has_many :review_tags
  has_many :reviews, :through => :review_tags
end
