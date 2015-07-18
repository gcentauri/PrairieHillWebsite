module ActivitiesHelper

  def get_open_shifts
    Shift.where(user_id: nil)
  end
  
  def get_activity_open_shifts(activity)
    activity.shifts.select { |s| s.user_id == nil }
  end

  def full_user_name(id)
    first = User.find(id).first_name
    last = User.find(id).last_name

    return "#{first} #{last}"
  end
end
