class Giving < ApplicationRecord
  belongs_to :pet
  belongs_to :giver, :class_name => "User"
end
