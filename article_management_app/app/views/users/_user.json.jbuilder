json.extract! user, :id, :user_id, :user_name, :email, :created_at, :updated_at
json.url user_url(user, format: :json)
