json.array!(@activities) do |activity|
  json.extract! activity, :id, :work_area, :coordinator, :sign, :num_tickets, :vol_needed, :shift_ids
  json.url activity_url(activity, format: :json)
end
