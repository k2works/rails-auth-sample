json.array!(@belongs) do |belong|
  json.extract! belong, :id, :name
  json.url belong_url(belong, format: :json)
end
