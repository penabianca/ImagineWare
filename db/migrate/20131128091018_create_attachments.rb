class CreateAttachments < ActiveRecord::Migration
  def up
    create_table 'attachments' do |t|
      t.string 'filename'
      t.string 'type'
      t.text   'data'
      t.datetime 'attachment_date'
      t.timestamps
    end
  end

  def down
    drop_table 'attachments'
  end
end
