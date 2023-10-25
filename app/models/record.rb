class Record < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :record_items
  has_many :categories, through: :record_items
end
