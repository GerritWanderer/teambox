class AddReadersToMessage < ActiveRecord::Migration
  def change
    add_column :messages, :readers, :text
  end
end
