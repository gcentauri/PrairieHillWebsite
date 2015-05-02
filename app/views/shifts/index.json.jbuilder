json.array!(@shifts) do |shift|
  json.extract! shift, :id, :title, :vols_needed
  json.start shift.start_time
  json.end shift.end_time
  json.url shift_url(shift, format: :html)
end
