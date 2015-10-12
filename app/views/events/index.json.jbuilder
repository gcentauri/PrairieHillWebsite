json.array!(@events) do |event|
  json.extract! event, :id, :title, :subtitle, :location, :location_address, :date_and_time, :parent, :description, :links, :event_image_id
  json.url event_url(event, format: :json)
end
