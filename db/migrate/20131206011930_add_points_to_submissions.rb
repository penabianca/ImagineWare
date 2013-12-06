class AddPointsToSubmissions < ActiveRecord::Migration
  def change
    add_column :submissions, :points, :integer, default: 0
  end
end
