module ShiftsHelper

  def get_times
    
  @start_times = [
    ['Friday 4pm', 'Fri, 02 Oct 2015 16:00:00 UTC +00:00'],
    ['Saturday 9am', 'Sat, 03 Oct 2015 09:00:00 UTC +00:00'],
    ['Sat 11am', 'Sat, 03 Oct 2015 11:00:00 UTC +00:00'],
    ['Sat 12pm', 'Sat, 03 Oct 2015 12:00:00 UTC +00:00'],
    ['Sat 1pm', 'Sat, 03 Oct 2015 13:00:00 UTC +00:00'],
    ['Sat 2pm', 'Sat, 03 Oct 2015 14:00:00 UTC +00:00'],
    ['Sat 3pm', 'Sat, 03 Oct 2015 15:00:00 UTC +00:00']
  ]

  @end_times = [
    ['Friday 6pm', 'Fri, 02 Oct 2015 18:00:00 UTC +00:00'],
    ['Sat 11am', 'Sat, 03 Oct 2015 11:00:00 UTC +00:00'],
    ['Sat 12pm', 'Sat, 03 Oct 2015 12:00:00 UTC +00:00'],
    ['Sat 1pm', 'Sat, 03 Oct 2015 13:00:00 UTC +00:00'],
    ['Sat 2pm', 'Sat, 03 Oct 2015 14:00:00 UTC +00:00'],
    ['Sat 3pm', 'Sat, 03 Oct 2015 15:00:00 UTC +00:00'],
    ['Sat 5pm', 'Sat, 03 Oct 2015 17:00:00 UTC +00:00']
  ]

  return [@start_times, @end_times]
  end
    
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
