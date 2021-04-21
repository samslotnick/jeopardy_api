json.game do |json|
  json.partial! 'games/game', game: @game
end