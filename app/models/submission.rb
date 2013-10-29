class Submission < ActiveRecord::Base
  attr_accessible :user_id, :course_id, :grade, :feedback
  before_save :default_values
  def default_values
    self.feedback ||= 'Your submission has not been graded yet'
    self.grade ||= 'Pending'
  end
end
