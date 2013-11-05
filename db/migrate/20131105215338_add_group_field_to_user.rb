class AddGroupFieldToUser < ActiveRecord::Migration
  def change
    add_column :users, :group, :integer
  end
end
