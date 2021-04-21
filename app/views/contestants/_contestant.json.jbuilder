json.(contestant, :name, :game_id, :created_at, :updated_at)
json.game contestant.game, partial: 'contestants/contestant', as: :contestant