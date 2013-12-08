class DropHospitalsTable < ActiveRecord::Migration
  def up
    drop_table :hospitals
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
