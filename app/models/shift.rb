class Shift < ActiveRecord::Base
  has_and_belongs_to_many :users

  def add_user_idee(id)

    user_ids_will_change!
    
    update_attributes user_ids: user_ids + [ id ]

  end


end
