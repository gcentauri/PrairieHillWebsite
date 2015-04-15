
json.volunteer do
  json.id  @volunteer.id
  json.name @volunteer.name
  json.email @volunteer.email
  json.phone @volunteer.phone

  #json.period_id @log.period ? @log.period_id : nil
end
