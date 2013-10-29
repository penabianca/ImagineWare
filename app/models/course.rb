class Course < ActiveRecord::Base
  attr_accessible :title, :content, :tag_list
  acts_as_taggable_on :tags
end
