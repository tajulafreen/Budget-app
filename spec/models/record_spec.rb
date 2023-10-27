require 'rails_helper'

RSpec.describe Record, type: :model do
  context 'Associations' do
    it { should belong_to(:user).class_name('User').with_foreign_key('author_id') }
    it { should have_and_belong_to_many(:categories).join_table('categories_records').dependent(:destroy) }
  end

  context 'Validations' do
    it { should validate_presence_of(:author_id) }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:amount) }
    it { should validate_numericality_of(:amount).is_greater_than_or_equal_to(0) }
  end
end