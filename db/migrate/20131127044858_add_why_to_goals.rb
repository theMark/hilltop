class AddWhyToGoals < ActiveRecord::Migration
  def change
    add_column :goals, :why, :text
  end
end
