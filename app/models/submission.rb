class Submission < ActiveRecord::Base
  attr_accessible :grader_id , :grade, :feedback, :user, :course
  belongs_to :user
  belongs_to :course
  def self.new_submission
    new { |u| u.feedback = "student's submission", u.grade = "Pending"}
  end
end
