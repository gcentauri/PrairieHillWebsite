
json.volunteers @volunteers do |vol|
  json.id vol.id
  json.name vol.name
  json.email vol.email
  json.phone vol.phone
  
  #json.period_id log.period ? log.period_id : nil
end
