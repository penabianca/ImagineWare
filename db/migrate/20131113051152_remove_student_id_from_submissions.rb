class RemoveStudentIdFromSubmissions < ActiveRecord::Migration
  def up
    #remove_column :submissions, :student_id
  end

  def down
    #add_column :submissions, :student_id, :integer
  end
end
