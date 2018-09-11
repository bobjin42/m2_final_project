class Giving < ApplicationRecord
  belongs_to :pet, :class_name => "Pet"
  belongs_to :giver, :class_name => "User"
end
