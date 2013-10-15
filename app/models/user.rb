class User < ActiveRecord::Base
  authenticates_with_sorcery!
  
  attr_accessible :username, :email, :password, :password_confirmation

  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :email
  validates_uniqueness_of :email
  #validates_length_of :password, :minimum => 3, :message => "password must be at least 3 characters long", :if => :password
 # validates_confirmation_of :password, :message => "should match confirmation", :if => :password
 
 has_many :goals, :dependent => :destroy
 has_many :updates, :dependent => :destroy
 
 
  def has_goal?(goal)
    self.gaols.exists?(:id => goal.id)
  end
 
 
end
