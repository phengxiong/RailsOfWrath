json.array!(@newsletters) do |newsletter|
  json.extract! newsletter, :id, :title, :author, :content
  json.url newsletter_url(newsletter, format: :json)
end
