class Category < ApplicationRecord
    has_many :record_items
    has_many :records, through: :record_items
end
