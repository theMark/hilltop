class AddExpiredToGoals < ActiveRecord::Migration
  def change
    add_column :goals, :expired, :boolean, :default => false
  end
end
