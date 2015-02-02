json.array!(@forums) do |forum|
  json.extract! forum, :id, :forum_id, :author, :title, :content, :published_date
  json.url forum_url(forum, format: :json)
end
