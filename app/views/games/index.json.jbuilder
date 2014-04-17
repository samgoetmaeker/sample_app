json.array!(@games) do |game|
  json.extract! game, :id, :type, :name
  json.url game_url(game, format: :json)
end
