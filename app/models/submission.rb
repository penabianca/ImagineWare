class Submission < ActiveRecord::Base
<<<<<<< HEAD
  attr_accessible :grader_id , :grade, :feedback, :user, :course
||||||| merged common ancestors
  attr_accessible :grader_id , :grade, :feedback
=======
  attr_accessible :user_id,:grader_id , :grade, :feedback
>>>>>>> 4eb5ef36f081e91127fbbfe02358dbd2b6f25067
  belongs_to :user
  belongs_to :course
  def self.new_submission
    new { |u| u.feedback = "Your submission has not been graded yet", u.grade = "Pending"}
  end
end
