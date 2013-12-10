class ModifySubmissionFields < ActiveRecord::Migration
  def change
    add_column :submissions, :user_id, :integer
    add_column :submissions, :grader_id, :string
  end
end
