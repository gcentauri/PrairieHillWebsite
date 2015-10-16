class Event < ActiveRecord::Base
  #attachment :event_image
  has_attached_file :event_image, styles: { xlarge: "900x900>", large: "600x600>", medium: "300x300>", small: "200x200>", icon: "80x80>", thumb: "100x100>", thumbcrop: "100x100" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :event_image, content_type: /\Aimage\/.*\Z/
end
