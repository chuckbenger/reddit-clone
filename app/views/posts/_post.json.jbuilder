json.extract! post, :id, :name, :description, :subreddit_id, :user_id, :created_at, :updated_at
json.url post_url(post, format: :json)
