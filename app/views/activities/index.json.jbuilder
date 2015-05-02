json.array!(@activities) do |activity|
  json.extract! activity, :id, :work_area, :coordinator, :sign, :num_tickets, :vol_needed, :shift_ids
  json.start activity.start_time
  json.end activity.end_time
  json.url activity_url(activity, format: :html)
end
