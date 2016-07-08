class Review < ActiveRecord::Base
  belongs_to :author
  has_many :review_tags
  has_many :tags, :through => :review_tags

  validates_presence_of :title, :content, :score
end
