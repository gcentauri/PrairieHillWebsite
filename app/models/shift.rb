class Shift < ActiveRecord::Base
  has_and_belongs_to_many :users

  # def add_user_id_to_shift(user_id)

  #   user_ids_will_change!
    
  #   #update_attribute :user_ids, shift.user_ids << user_id
    
  #   update_attributes user_ids: self.user_ids + [ user_id ]
  #   self.save
  # end


end
