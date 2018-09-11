class User < ApplicationRecord
  has_many :adoptions, :foreign_key => 'adoptor_id'
  has_many :givings, :foreign_key => 'giver_id'
  has_many :adoptor_pets, through: :adoptions, :source => :pet
  has_many :giver_pets, through: :givings, :source => :pet
  has_secure_password
end
