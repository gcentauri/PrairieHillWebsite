class Shift < ActiveRecord::Base
  #has_and_belongs_to_many :users, :dependent => :destroy
  #accepts_nested_attributes_for :users

  has_many :timeslots
  has_many :activities, :through => :timeslots

  belongs_to :user
  #belongs_to :guest

  # def self.to_xlsx(options = {})

  #   workbook = WriteExcel.new('shifts.xlsx')
   
  #   @shiftTitles = all.pluck(:title).uniq
  #   @shiftTitles.each do |title|
     
  #     worksheet = workbook.add_worksheet

  #     worksheet.write(0, 0, title) 

  #     @shifts_by_title = all.where(title: title)      
  #     @shifts_by_title.each do |shift|
  #       worksheet.write(1, 1, 'hotdog' )#shift.title)
  #     end
  #   end

  #   workbook.close

  # end

  # def self.to_csv(options = {})
  #   CSV.generate(options) do |csv|
  #     csv << ["", "Time", "Volunteer", "Guest Volunteer"]
  #     @shiftTitles = all.pluck(:title).uniq
  #     @shiftTitles.each do |title|
  #       csv << [title]
  #       @shifts_by_title = all.where(title: title)
  #       @shifts_by_title.each do |shift|
  #         csv << ["", shift.time, shift.volunteer, shift.guest]
  #       end
  #     end
  #   end
  # end

  # def add_user_idee(id)
   
  #   user_ids_will_change!
  #   update_attribute(:user_ids, self.user_ids << id)

  #   self.save

  # end

  # def cancel_shift

  #   shift.volunteer = nil
  #   shift.save

  # end
end
