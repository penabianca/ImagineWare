class Course < ActiveRecord::Base
  attr_accessible :title, :tags, :content
  def self.all_tags
    return ['beginner', 'intermediate', 'advanced']
  end
end
