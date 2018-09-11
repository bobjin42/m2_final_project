class Pet < ApplicationRecord
  belongs_to :store
  has_many :adoptions
  has_many :givings
  has_many :adoptors, :class_name => "User", through: :adoptions
  has_many :givers, :class_name => "User", through: :givings


end
