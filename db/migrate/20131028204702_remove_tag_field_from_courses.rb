class RemoveTagFieldFromCourses < ActiveRecord::Migration
  def up
    remove_column :courses, :tags
  end

  def down
    add_column :courses, :tags, :string
  end
end
