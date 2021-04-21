class Game < ApplicationRecord
  belongs_to :user
  scope :created_by, ->(username){where(user: User.where(username: username))}
  before_create :generate_game_code
  has_many :contestants
  has_many :questions
  has_many :buzzs

  def generate_game_code
    self.code = SecureRandom.alphanumeric(7)
  end
end
