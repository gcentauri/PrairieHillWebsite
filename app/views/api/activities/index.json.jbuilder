
json.activities @activities do |act|
  json.id act.id
  json.work_area act.work_area
  json.coordinator act.coordinator
  json.sign act.sign
  json.comments act.comments

  #json.period_id log.period ? log.period_id : nil
end
