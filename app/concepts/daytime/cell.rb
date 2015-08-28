class Daytime::Cell < Cell::Concept
  
  def show
    render
  end

  private

  def day
    "#{print_shift_time(@shift.start_time, 'day')} #{print_shift_time(@shift.start_time, 'time')} - #{print_shift_time(@shift.end_time, 'time')}"
  end
end
