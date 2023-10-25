class Category < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :records

  # validation
  validates :name, presence: true
  validates :icon, presence: true
end
