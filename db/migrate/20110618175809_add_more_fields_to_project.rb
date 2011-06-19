class AddMoreFieldsToProject < ActiveRecord::Migration
  def change
    add_column :projects, :closed, :integer, :default => 0
    add_column :projects, :description, :text
  end
end
