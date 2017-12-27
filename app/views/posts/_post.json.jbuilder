json.extract! post, :id, :name, :description, :body, :category_id, :created_at, :updated_at
json.url post_url(post, format: :json)
