class Timeslot < ActiveRecord::Base
  belongs_to :activity
  belongs_to :shift
end
