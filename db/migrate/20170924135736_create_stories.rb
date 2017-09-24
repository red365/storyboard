class CreateStories < ActiveRecord::Migration[5.1]
  def change
    create_table :stories do |t|
      t.string :title
      t.string :actor
      t.text :action
      t.text :objective
      t.text :notes
      t.text :how_to_test
      t.text :definition_of_done
      t.float :estimate
      t.float :completion_time
      t.integer :completed

      t.timestamps
    end
  end
end
