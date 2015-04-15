
json.user do
  json.id  @user.id
  json.username @user.username
  json.name @user.name
  json.admin @user.admin
  json.first_name @user.first_name
  json.last_name @user.last_name  
  json.phone @user.phone

  #json.period_id @log.period ? @log.period_id : nil
end
