class User < ApplicationRecord
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :username, uniqueness: { case_sensitive: false }, presence: true, allow_blank: false, format: { with: /\A[a-zA-Z0-9]+\z/ }
  has_many :contestants, through: :game
  has_many :questions, through: :game

    def generate_jwt
      JWT.encode({ id: id,
                  exp: 60.days.from_now.to_i },
                Rails.application.secrets.secret_key_base)
    end

end
