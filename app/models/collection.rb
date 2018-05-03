class Collection < ApplicationRecord
  belongs_to :user
  has_many :cardcollections#, dependant: :destroy
  has_many :cards, through: :cardcollections
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :name, presence: true
end
