json.array!(@images) do |image|
  json.extract! image, :id, :url, :title, :description, :case_log_id
  json.url image_url(image, format: :json)
end
