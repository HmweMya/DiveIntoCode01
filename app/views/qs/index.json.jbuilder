json.array!(@qs) do |q|
  json.extract! q, :id
  json.url q_url(q, format: :json)
end
