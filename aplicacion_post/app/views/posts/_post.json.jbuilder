json.extract! post, :id, :titulo, :cuerpo, :created_at, :updated_at
json.url post_url(post, format: :json)