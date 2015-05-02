module ApplicationHelper

  def print_shift_time(shift_time, opt)
    unless shift_time.nil?
      case opt
      when 'date'
        shift_time.strftime("%a %b %d %Y")
      when 'date-short'
        shift_time.strftime("%a %b %d")
      when 'date-day'
        shift_time.strftime("%a")
      when 'time'
        shift_time.strftime("%I:%M %p")
      end
    end
  end

  def nice_print(shift)
    "(#{print_shift_time(shift.start_time, 'date-day')}): #{print_shift_time(shift.start_time, 'time')} - #{print_shift_time(shift.end_time, 'time')}"
  end

  def nice_print_short(shift)
    "(#{print_shift_time(shift.start_time, 'date-short')}): #{print_shift_time(shift.start_time, 'time')} - #{print_shift_time(shift.end_time, 'time')}"
  end

  def nav_link(link_text, link_path)
    if current_page?(link_path)
      class_name = 'active'
    else
      class_name = ''
    end

    #class_name = current_page?(link_path) ? 'active' : ''

    content_tag(:li, :class => class_name) do
      link_to link_text, link_path
    end
  end

end
