
json.activity do
  json.id  @activity.id
  json.work_area @activity.work_area
  json.coordinator @activity.coordinator
  json.sign @activity.sign
  json.comments @activity.comments

  #json.period_id @log.period ? @log.period_id : nil
end
