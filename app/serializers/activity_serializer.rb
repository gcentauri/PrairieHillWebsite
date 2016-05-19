class ActivitySerializer < ActiveModel::Serializer
  
  attributes :id, :work_area, :coordinator, :sign, :num_tickets, :vol_needed, :shift_ids, :created_at, :updated_at, :comments, :start_time, :end_time, :category
  
end
