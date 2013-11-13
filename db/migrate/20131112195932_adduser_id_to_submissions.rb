class AdduserIdToSubmissions < ActiveRecord::Migration
  def change
    add_column :submissions, :user_id, :integer
  end
end
