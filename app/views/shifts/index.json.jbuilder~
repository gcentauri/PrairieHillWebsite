json.array!(@shifts) do |shift|
  json.extract! shift, :id, :title, :vols_needed, :user_ids
  json.url shift_url(shift, format: :json)
end
