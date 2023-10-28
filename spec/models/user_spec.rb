require 'rails_helper'

RSpec.describe User, type: :model do
  context 'Validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password) }
  end

  context 'Associations' do
    it { should have_many(:records).class_name('Record').with_foreign_key('author_id').dependent(:destroy) }
    it { should have_many(:categories).class_name('Category').with_foreign_key('user_id').dependent(:destroy) }
  end

  context 'Devise modules' do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password) }
    it { should validate_uniqueness_of(:email).case_insensitive }
    it { should allow_value('test@example.com').for(:email) }
  end
end
