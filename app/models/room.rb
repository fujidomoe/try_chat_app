class Room < ApplicationRecord
  belongs_to :organization
  has_many :messages
end
