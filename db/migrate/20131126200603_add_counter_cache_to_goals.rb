class AddCounterCacheToGoals < ActiveRecord::Migration

  def up
    add_column :goals, :updates_count, :integer, :default => 0

    Goal.find_each(select: 'id') do |result|
      Goal.reset_counters(result.id, :updates)
    end
  end

  def down
    remove_column :goals, :updates_count
  end
  
  
end
