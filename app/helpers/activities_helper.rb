module ActivitiesHelper
  def full_user_name(id)
    first = User.find(id).first_name
    last = User.find(id).last_name

    return "#{first} #{last}"
  end
end
