class AddInstrucToUsers < ActiveRecord::Migration
  def change
    add_column :users, :instruc, :boolean, default: false
  end
end
