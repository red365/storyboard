class AddPriorityToStory < ActiveRecord::Migration[5.1]
  def change
    add_column :stories, :priority, :integer
  end
end
