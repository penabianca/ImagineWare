class DropDataFilesTable < ActiveRecord::Migration
  def up
    drop_table :data_files
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
