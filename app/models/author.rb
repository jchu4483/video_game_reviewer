class Author < ActiveRecord::Base
  has_many :reviews
  has_secure_password

  validates_uniqueness_of :email
  validates_presence_of :email, :name

  def slug
    self.name.gsub(" ", ",")
  end

  def self.find_by_slug(slug)
    self.all.detect {|instance| instance.slug == slug}
  end
end
