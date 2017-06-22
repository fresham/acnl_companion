class Fish < ApplicationRecord
  has_one :creature, as: :creatures
end
