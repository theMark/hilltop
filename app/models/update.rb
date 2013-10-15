class Update < ActiveRecord::Base
  validates :title, :body, :presence =>  true
  
  attr_accessible :body, :goal_id, :title, :user_id
  
  belongs_to :goal
  belongs_to :user
  
end
