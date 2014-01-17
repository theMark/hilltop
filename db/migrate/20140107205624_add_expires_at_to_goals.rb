class AddExpiresAtToGoals < ActiveRecord::Migration
  def change
    add_column :goals, :expires_at, :datetime
  end
end
