json.extract! provider, :id, :name, :active, :api_token, :api_token_required, :default, :shortened_links_count, :created_at, :updated_at
json.url provider_url(provider, format: :json)
