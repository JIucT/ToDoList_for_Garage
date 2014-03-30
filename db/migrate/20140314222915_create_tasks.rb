class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.references :project
      t.string :name, :null => false, :limit => 100
      t.integer :priority
      t.datetime :deadline
      t.boolean :completed

      t.timestamps
    end
    add_index :tasks, :priority    
  end
end
