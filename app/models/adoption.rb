class Adoption < ApplicationRecord
  belongs_to :pet, :class_name => "Pet"
  belongs_to :adoptor, :class_name => "User"


end
