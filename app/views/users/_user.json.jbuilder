json.extract! user, :id, :name, :phoneno, :created_at, :updated_at
json.url user_url(user, format: :json)
