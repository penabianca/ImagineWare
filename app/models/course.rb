class Course < ActiveRecord::Base
<<<<<<< HEAD
  attr_accessible :title, :tags, :content
  def self.all_tags
    return ['beginner', 'intermediate', 'advanced']
  end
=======
  attr_accessible :title, :content, :tag_list
  acts_as_taggable_on :tags
>>>>>>> fabadd983577467e9b45de0de4eaadd6141233a6
end
