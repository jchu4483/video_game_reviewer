class ReviewTag < ActiveRecord::Base
  belongs_to :review
  belongs_to :tag

  extend Slugifiable::ClassMethods
  
end
