json.contestants do |json|
  json.partial! 'contestants', game: @game
end