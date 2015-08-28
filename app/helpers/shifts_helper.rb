module ShiftsHelper
  
  def user_shifts(user)
    @user = current_user

    @user.shifts.sort

    # @user = current_user
    # @shifts = Shift.all
    # @username = @user.first_name + " " + @user.last_name
    # @user_shifts = @shifts.where(volunteer: @username).sort_by { |s| s.title }
  end

  def get_activity_title(shift)
    Activity.find(shift.activity_id).work_area
  end

  def natural_order(shift)

    day = shift.time.split.first
    time = shift.time.split.second.split('-') 
    start = time.first
    stop = time.second
    septDate = if day == "Saturday"
                 "27th"
               else
                 "26th"
               end
    truetime = Chronic.parse(day + " " + septDate + " " + start)

    truetime
  end

end
