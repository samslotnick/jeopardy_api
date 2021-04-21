class GameChannel < ApplicationCable::Channel
  def subscribed
    if params[:code].present?
      stream_from("GameRoom-#{(params[:code])}")
    end
  end
  
  def buzz
    sender = get_sender(data)
    game_id = data['code']

    buzz_queue = get_queue(code)

    Buzz.create!(
      buzzed: true,
      sender: sender
    )
    
  end
  
  def get_sender
    Contestant.find_by(params [:contesant_id])
  end
end