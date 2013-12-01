class DropAttachmentsTable < ActiveRecord::Migration
  def up
    drop_table :Attachments
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
