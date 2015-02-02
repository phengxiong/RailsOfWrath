json.array!(@comments) do |comment|
  json.extract! comment, :id, :author, :content, :date_published, :forum_id
  json.url comment_url(comment, format: :json)
end
