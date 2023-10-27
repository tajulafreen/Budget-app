require 'rails_helper'

RSpec.describe Category, type: :model do
  context 'Associations' do
    it { should belong_to(:user).class_name('User').with_foreign_key('user_id') }
    it { should have_and_belong_to_many(:records).join_table('categories_records').dependent(:destroy) }
  end

  context 'Validations' do
    it { should validate_presence_of(:user_id) }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:icon) }
  end
end




