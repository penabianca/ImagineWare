class AddSubmissionFields < ActiveRecord::Migration
  def change
    add_column :submissions, :user_id, :integer
    add_column :submissions, :course_id, :integer
    add_column :submissions, :grade, :string
    add_column :submissions, :feedback, :string
  end
end
