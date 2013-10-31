class ModifySubmissionFields < ActiveRecord::Migration
  def change
    remove_column :submissions, :user_id, :integer
    add_column :submissions, :student_id, :integer
    add_column :submissions, :grader_id, :string
  end
end
