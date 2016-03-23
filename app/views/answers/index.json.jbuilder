json.array!(@answers) do |answer|
  json.extract! answer, :id, :q_id, :user_id, :content
  json.url answer_url(answer, format: :json)
end
