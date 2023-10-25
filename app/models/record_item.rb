class RecordItem < ApplicationRecord
    belongs_to :record
    belongs_to :category
end
