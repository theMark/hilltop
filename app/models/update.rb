class Update < ActiveRecord::Base
  validates :title, :body, :presence =>  true
  
  attr_accessible :body, :goal_id, :title, :user_id, :mood
  
  belongs_to :goal, :counter_cache => true
  belongs_to :user
  
  
  scope :recent, lambda { where("created_at >= ?", 3.days.ago.to_datetime) }
  
  
  
end
