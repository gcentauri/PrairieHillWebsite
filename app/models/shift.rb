class Shift < ActiveRecord::Base
  has_and_belongs_to_many :users, :dependent => :destroy
  accepts_nested_attributes_for :users

  def add_user_idee(id)
    
    user_ids_will_change!
    update_attribute(:user_ids, self.user_ids << id)

    #update_attribute(:user_ids, user_ids + [ id ])
    #update_attributes user_ids: user_ids.unshift(id)

    self.save

  end

  


end
