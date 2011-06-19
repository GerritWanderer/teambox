class AddParentMessageToMessage < ActiveRecord::Migration
  def change
    add_column :messages, :topic_id, :integer
    add_column :messages, :topic_type, :text, :default => "Message"
    add_column :messages, :user_id, :integer
  end
end
