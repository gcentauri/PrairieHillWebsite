
json.shift do
  json.id  @shift.id
  json.title @shift.title
  json.time @shift.time
  json.vols_needed @shift.vols_needed
  json.volunteers @shift.volunteers
  json.volunteer @shift.volunteer
  json.guest @shift.guest

  #json.period_id @log.period ? @log.period_id : nil
end
