
json.page do
  json.id  @page.id
  json.title @page.title
  json.description @page.description

  #json.period_id @log.period ? @log.period_id : nil
end
