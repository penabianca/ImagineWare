class AddPointsToSubmissions < ActiveRecord::Migration
  def change
    add_column :submissions, :points, :integer
  end
end
