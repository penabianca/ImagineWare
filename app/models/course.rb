class Course < ActiveRecord::Base
  attr_accessible :title, :content, :tag_list
  acts_as_taggable_on :tags
  def self.all_grades
    %W(A A- B+ B B- C+ C C- D+ D D- F)
  end
end
