class Submission < ActiveRecord::Base
  attr_accessible :grader_id, :grade, :feedback
  before_save :default_values
  belongs_to :user
  belongs_to :course
  def default_values
    self.feedback ||= 'Your submission has not been graded yet'
    self.grade ||= 'Pending'
  end
end
