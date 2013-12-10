class ChangeContentForCourses < ActiveRecord::Migration

  change_table :courses do |t|
    t.change :content, :text
  end

end
