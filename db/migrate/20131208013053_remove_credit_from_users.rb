class RemoveCreditFromUsers < ActiveRecord::Migration
  def up
    remove_column :users, :credit
  end

  def down
    add_column :users, :credit, :integer
  end
end
