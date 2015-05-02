module ShiftsHelper
  
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
