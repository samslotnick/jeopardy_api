json.contestants do |json|
  json.array! @contestants, partial: 'contestants/contestant'
end