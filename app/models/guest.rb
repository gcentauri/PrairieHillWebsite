class Guest < ActiveRecord::Base

  has_many :shifts
  belongs_to :user
  
end
