class Record < ApplicationRecord
    belongs_to :author, class_name: 'User'
    has_and_belongs_to_many :categories
  
    # validations
    validates :name, presence: true
    validates :amount, presence: true
    validates :categories, presence: true
end
