class Shift < ActiveRecord::Base
  has_and_belongs_to_many :users, :dependent => :destroy
  accepts_nested_attributes_for :users

  def add_user_idee(id)
    
    user_ids_will_change!
    update_attribute(:user_ids, self.user_ids << id)

    self.save

  end

  def cancel_shift

    shift.volunteer = nil
    shift.save

  end
  


end
