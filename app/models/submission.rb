class Submission < ActiveRecord::Base
  attr_accessible :grader_id , :grade, :feedback, :user, :course
  belongs_to :user
  belongs_to :course
  has_one    :attachment
  def self.new_submission
    new { |u| u.feedback = "student's submission", u.grade = "Pending"}
  end
  def self.non_graded_assignments
    Submission.where(:grade => 'Pending')
  end
  def self.student_submissions(id)
    Submission.where('user_id' =>id.to_i)
  end


end

