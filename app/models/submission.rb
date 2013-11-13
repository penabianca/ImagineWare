class Submission < ActiveRecord::Base
  attr_accessible :grader_id , :grade, :feedback
  belongs_to :user
  belongs_to :course
  def self.new_submission(current_user, course)
    new { |u| u.user_id = current_user , u.course_id = course.id, u.feedback = 'Your submission has not been graded yet',
         u.grade = 'Pending'}
  end
end
