module ApplicationHelper

  def featured_event
    events = Event.all
    public_events = events.select { |e| e.public }
    featured = public_events.select { |e| e.featured }
    past = featured.select { |e| e.date_and_time < Time.now }
    upcoming = featured.select { |e| e.date_and_time > Time.now }

    #if current datetime is newer than public datetime
    #where does this logic really belong?
    #add featured to model
    unless upcoming.empty?
      return upcoming.first.id
    else
      return ''
    end

  end
  
  def print_shift_time(shift_time, opt)
    unless shift_time.nil?
      case opt
      when 'date'
        shift_time.strftime("%A %D %Y")
      when 'date-short'
        shift_time.strftime("%A %D")
      when 'date-day'
        shift_time.strftime("%A")
      when 'time'
        shift_time.strftime("%l:%M %p")
      when 'day'
        shift_time.strftime("%^a")
      end
    end
  end

  def nice_print(shift)
    "#{print_shift_time(shift.start_time, 'date-day')} ( #{print_shift_time(shift.start_time, 'time')} - #{print_shift_time(shift.end_time, 'time')} )"
  end

  def nice_print_short(shift)
    "#{print_shift_time(shift.start_time, 'date-short')} ( #{print_shift_time(shift.start_time, 'time')} - #{print_shift_time(shift.end_time, 'time')} )"
  end

  def nav_link(link_text, link_path, *class_option)
  #def nav_link(link_text, link_path, *link_method, *class_name)
    if current_page?(link_path)
      class_name = 'active'
    else
      class_name = class_option
    end

    #class_name = current_page?(link_path) ? 'active' : ''

    content_tag(:li, class: class_name) do
      link_to(link_text, link_path)
      #link_to(link_text, link_path, method: link_method, class: class_name)
    end
  end

end
