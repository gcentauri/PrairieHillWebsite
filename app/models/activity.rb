
class Activity < ActiveRecord::Base

  has_many :shifts

  accepts_nested_attributes_for :shifts, reject_if: :all_blank, allow_destroy: true

  # def self.to_csv(activity_attributes = column_names, shift_attributes = activity.shifts.column_names, options = {})

  #   CSV.generate(options) do |csv|
  #     csv.add_row activity_attributes + shift_attributes

  #     all.each do |activity|

  #       values = activity.attributes.slice(*activity_attributes).values

  #       if activity.shifts
  #         values += activity.shifts.attributes.slice(*shift_attributes).values
  #       end
        
  #       csv.add_row values
  #     end
  #   end
  # end
end
