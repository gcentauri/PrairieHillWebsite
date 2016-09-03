class Activity < ActiveRecord::Base

  has_many :shifts
  accepts_nested_attributes_for :shifts, reject_if: :all_blank, allow_destroy: true
 
  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |activity|
        csv << activity.attributes.values_at(*column_names)
      end
    end
  end
end
