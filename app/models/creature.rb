class Creature < ApplicationRecord
  belongs_to :creatures, polymorphic: true
end
