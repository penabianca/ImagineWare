class AddAttachmentIdToSubmissions < ActiveRecord::Migration
  def change
    add_column :submissions, :attachment_id, :integer
  end
end
