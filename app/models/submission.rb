class Submission < ActiveRecord::Base
<<<<<<< HEAD
  attr_accessible :grader_id , :grade, :feedback, :user, :course
||||||| merged common ancestors
  attr_accessible :user_id,:grader_id , :grade, :feedback
=======
  attr_accessible :user_id,:grader_id , :grade, :feedback, :course_id
>>>>>>> 1ab13f860fe26e99ed449a63ef0ba88fd762de37
  belongs_to :user
  belongs_to :course
  def self.new_submission
    new { |u| u.feedback = "student's submission", u.grade = "Pending"}
  end
end
