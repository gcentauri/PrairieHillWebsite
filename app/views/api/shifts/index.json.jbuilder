
json.shifts @shifts do |shift|
  json.id shift.id
  json.title shift.title
  json.time shift.time
  json.vols_needed shift.vols_needed
  json.volunteer shift.volunteer
  json.guest shift.guest

  #json.period_id log.period ? log.period_id : nil
end
