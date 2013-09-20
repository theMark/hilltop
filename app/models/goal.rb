class Goal < ActiveRecord::Base
  authenticates_with_sorcery!
  
  attr_accessible :complete, :description, :name
end
