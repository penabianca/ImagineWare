require 'spec_helper'

describe Submission do
=begin  describe 'grades and feedback should be default' do
    before :each do
      @sub = mock( Submission, :student_id => "1",:course_id => "1",:id =>"1")
      Submission.stub!(:find).with("1").and_return(@sub)
    end
    it 'should have Pending for grade' do
      @sub.grade.should_be "Pending"
    end


  end
=end
  pending "add some examples to (or delete) #{__FILE__}"
end
