json.extract! guest, :id, :name, :shift_ids, :user_id, :created_at, :updated_at
json.url guest_url(guest, format: :json)