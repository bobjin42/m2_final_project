class Adoption < ApplicationRecord
  belongs_to :pet
  belongs_to :adoptor, :class_name => "User"


end
