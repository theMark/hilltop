class Goal < ActiveRecord::Base
  authenticates_with_sorcery!
  
  attr_accessible :complete, :description, :name, :user_id, :why, :expires, :expires_at
  
  validates :name,  :presence => true
  
  
  has_many :updates , :dependent => :destroy
  belongs_to :user
  
	
  
  def related_goals
    Goal.where("user_id = ?", user_id).limit(5)
  end
  
  def get_expires_date
    self.created_at + 30.days
  end
  
end
