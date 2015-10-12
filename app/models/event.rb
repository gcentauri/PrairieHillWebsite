class Event < ActiveRecord::Base
  attachment :event_image
  #has_attached_file :event_image
  #validates_attachment_content_type :event_image, content_type: /\Aimage\/.*\Z/
end
