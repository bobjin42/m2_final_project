class User < ApplicationRecord
  has_many :adoptions, :foreign_key => 'adoptor_id'
  has_many :givings, :foreign_key => 'giver_id'
  has_many :pets, through: :adoptions
  has_many :pets, through: :givings
  has_secure_password
end
