module ShiftsHelper

  def get_times

    days = ["October 7th", "October 8th"]
    hours = {four: 4, six: 6, nine: 9, eleven: 11, twelve: 12, one: 1, two: 2, threee: 3, five: 5 }

    friday = days[0]
    saturday = days[1]

    friday_hours = [
      {
        start: hours[:four],
        stop: hours[:six]
      }
    ]
    
    saturday_hours = [
      {
        start: hours[:nine],
        stop: hours[:eleven]
      },

      {
        start: hours[:eleven],
        stop: hours[:twelve]
      },

      {
        start: hours[:twelve],
        stop: hours[:one]
      },

      {
        start: hours[:one],
        stop: hours[:two]
      },
      
      {
        start: hours[:two],
        stop: hours[:three]
      },
      
      {
        start: hours[:three],
        stop: hours[:five]
      }
    ]

    @times = {
      #Chronic.parse(friday + 
      'Fri 4pm'  => '2015-10-02 16:00:00 UTC',
      'Fri 6pm'  => '2015-10-02 18:00:00 UTC',
      'Sat 9am'  => '2015-10-03 09:00:00 UTC',
      'Sat 9:30am'  => '2015-10-03 09:30:00 UTC',
      'Sat 10am' => '2015-10-03 10:00:00 UTC',
      'Sat 11am' => '2015-10-03 11:00:00 UTC',
      'Sat 11:15am' => '2015-10-03 11:15:00 UTC',
      'Sat 11:30am' => '2015-10-03 11:30:00 UTC',
      'Sat 12pm' => '2015-10-03 12:00:00 UTC',
      'Sat 12:15pm' => '2015-10-03 12:15:00 UTC',
      'Sat 12:30pm' => '2015-10-03 12:30:00 UTC',
      'Sat 1pm'  => '2015-10-03 13:00:00 UTC',
      'Sat 1:15pm'  => '2015-10-03 13:15:00 UTC',
      'Sat 1:30pm'  => '2015-10-03 13:30:00 UTC',
      'Sat 2pm'  => '2015-10-03 14:00:00 UTC',
      'Sat 2:30pm'  => '2015-10-03 14:30:00 UTC',
      'Sat 3pm'  => '2015-10-03 15:00:00 UTC',
      'Sat 5pm'  => '2015-10-03 17:00:00 UTC'
    }

  end

  def get_time_title

    @titles = {}

    get_times.each do |t|
      @titles[t[1]] = t[0]
    end

    return @titles
    #return string.class
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

  def time_title_spacer(shift_time_short)
    time = shift_time_short
    pre = time.split('')[0..2].join
    count = time.length
    start = pre.length
    suf = time.split('')[start..count].join

    return "#{pre} #{suf}"
  end
  
end
