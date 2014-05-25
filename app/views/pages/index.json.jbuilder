json.array!(@pages) do |page|
  json.extract! page, :id, :title, :description, :index
  json.url page_url(page, format: :json)
end
