class Submission < ActiveRecord::Base
  attr_accessible :grader_id , :grade, :feedback, :user, :course
  belongs_to :user
  belongs_to :course
  def self.new_submission
    new { |u| u.feedback = "student's submission", u.grade = "Pending"}
  end
  def self.non_graded_assignments
    Submission.where(:grade => 'Pending')
  end
  def self.student_submissions(id)
    Submission.where('user_id' =>id.to_i)
  end

=begin
  def self.save(upload)
    name =  upload['datafile'].original_filename
    directory = "upload/public"
    #directory = Rails.root.join("upload","public","data");
    # create the file path
    #path = File.join(directory, name)
    # write the file
    #File.open(path, "wb") { |f| f.write(upload['datafile'].read) }
    File.open(Rails.root.join('public', 'upload', name), 'w') do |file|
      file.write(upload['datafile'].read)
    end
  end
=end
end

