class Goal < ActiveRecord::Base
  authenticates_with_sorcery!
  
  attr_accessible :complete, :description, :name, :user_id
  
  validates :name,  :presence => true
  
  
  has_many :updates , :dependent => :destroy
  belongs_to :user
  
end
