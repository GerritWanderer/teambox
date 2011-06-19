class AddReadersToAttachment < ActiveRecord::Migration
  def change
    add_column :attachments, :readers, :text
  end
end
