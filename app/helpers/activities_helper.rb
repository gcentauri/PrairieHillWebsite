module ActivitiesHelper

  def get_activity_shifts

  end

  ###############################
  def get_closed_shifts
    Shift.where.not(user_id: nil)
  end
  
  def get_open_shifts
    Shift.where(user_id: nil)
  end

  def station_shifts
    Shift.where(category: "Station").all
  end

  def prep_shifts
    Shift.where(category: "Preparation").all
  end

  def teardown_shifts
    Shift.where(category: "Tear Down").all
  end
  
  def get_open_station_shifts
    station_shifts.select { |s| s.user_id == nil }
  end

  def get_open_teardown_shifts
    teardown_shifts.select { |s| s.user_id == nil }
  end

  def get_open_prep_shifts
    prep_shifts.select { |s| s.user_id == nil }
  end

  def get_activity_open_shifts(activity)
    activity.shifts.select { |s| s.user_id == nil }
  end

  def full_user_name(id)
    first = User.find(id).first_name
    last = User.find(id).last_name

    return "#{first} #{last}"
  end

  def get_type_shift_count(activity, type)
    case type
    when "All"
      @type_shifts = activity.shifts.order(:start_time)
      @type_count = @type_shifts.count
    else
      @type_shifts = activity.shifts.where(category: type).all.order(:start_time)
      @type_count = (@type_shifts.select { |s| s.user_id == nil }).count
    end
  end

end
