class Shift < ActiveRecord::Base
  has_and_belongs_to_many :users

  def add_user_id(user_id)

    user_ids_will_change!
    
    update_attributes user_ids: self.user_ids + [ user_id ]
    self.save
  end
end
