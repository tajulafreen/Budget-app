class Category < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'user_id'
  has_and_belongs_to_many :records, join_table: 'categories_records', dependent: :destroy

  validates :user_id, presence: true
  validates :name, presence: true
  validates :icon, presence: true
end
