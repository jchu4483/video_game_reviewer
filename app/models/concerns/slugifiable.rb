module Slugifiable

  module InstanceMethods
    def slug
      self.title.gsub(" ", ",")
    end
  end


  module ClassMethods
    def find_by_slug(slug)
      self.all.detect {|instance| instance.slug == slug}
    end
  end
end
