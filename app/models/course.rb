class Course < ActiveRecord::Base
  attr_accessible :title, :tags, :content
  def self.all_tags
    %w(beginner intermediate advanced web mobile coding)
  end
end
