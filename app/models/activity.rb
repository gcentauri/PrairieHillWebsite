class Activity < ActiveRecord::Base

  has_many :timeslots
  has_many :shifts, :through => :timeslots

  accepts_nested_attributes_for :shifts, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :timeslots
 
  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |activity|
        csv << activity.attributes.values_at(*column_names)
      end
    end
  end
end
