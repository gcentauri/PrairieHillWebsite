class Activity < ActiveRecord::Base

  has_many :shifts
 
  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |activity|
        csv << activity.attributes.values_at(*column_names)
      end
    end
  end
end
