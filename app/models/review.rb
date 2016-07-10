class Review < ActiveRecord::Base
  belongs_to :author
  has_many :review_tags
  has_many :tags, :through => :review_tags

  validates_presence_of :title, :content, :score

  extend Slugifiable::ClassMethods
  include Slugifiable::InstanceMethods

  def author_name=(name)
    self.author = Author.find_or_create_by(:name => name)
  end

  def add_tag_by_name(name)
    tag = Tag.find_or_create_by(:name => name)
    self.review_tags.build(:tag => tag)
  end

  def new_added_tag=(names_csv)
    tag_names = names_csv.split(",").collect{|t| t.strip}
    tag_names.each do |name|
      self.add_tag_by_name(name)
    end
  end
end
