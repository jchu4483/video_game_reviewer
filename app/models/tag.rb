class Tag < ActiveRecord::Base
  validates_presence_of :name
  has_many :review_tags
  has_many :reviews, :through => :review_tags

  def slug
    self.name.gsub(" ", ",")
  end

  def self.find_by_slug(slug)
    self.all.detect {|instance| instance.slug == slug}
  end
end
