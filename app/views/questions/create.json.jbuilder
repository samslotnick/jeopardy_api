json.question do |json|
  json.partial! 'questions/question', question: @question
end