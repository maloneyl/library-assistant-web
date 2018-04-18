json.cache! ['v1', @books], expires_in: 10.minutes do
  json.array! @books,
    :title,
    :author,
    :image_url,
    :average_rating,
    :year,
    :link,
    :isbn
end
