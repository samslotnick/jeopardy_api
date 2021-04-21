class Contestant < ApplicationRecord
  belongs_to :game
  has_many :buzzs
  
  validates :name, uniqueness: {scope: :game}
end
