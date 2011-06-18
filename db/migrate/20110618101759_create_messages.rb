class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :title
      t.text :body
      t.string :task
      t.references :project
      t.timestamps
    end
    add_index :messages, :project_id
  end
end
