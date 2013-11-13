class Submission < ActiveRecord::Base
  attr_accessible :grader_id , :grade, :feedback
  belongs_to :user
  belongs_to :course
  def self.new_submission
    new { |u| u.feedback = 'Your submission has not been graded yet',
      u.grade = 'Pending'}
  end
end
