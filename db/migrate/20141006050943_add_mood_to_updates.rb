class AddMoodToUpdates < ActiveRecord::Migration
  def change
    add_column :updates, :mood, :string
  end
end
