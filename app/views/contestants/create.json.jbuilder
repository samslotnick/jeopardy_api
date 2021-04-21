json.contestant do |json|
  json.partial! 'contestants/contestants', contestants: @game.contestant
end