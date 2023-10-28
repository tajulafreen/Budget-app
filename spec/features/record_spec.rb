require 'rails_helper'

RSpec.describe 'records/index', type: :feature do
  before(:each) do
    @user = User.create(id: '4', name: 'Hammas', email: 'hammas@gmail.com', password: 'hammas')
    @category = Category.create(id: '4',name: 'Office Payments', icon: 'https://avatars.githubusercontent.com/u/119053190?v=4', user: @user)
    @record = Record.create(id: '5',name: 'Over Time', amount: 200, author_id: @user.id)
    visit new_user_session_path
    fill_in 'Email', with: 'hammas@gmail.com'
    fill_in 'Password', with: 'hammas'
    click_button 'Log in'
    puts page
  end
  describe 'Testing index view of transaction' do
    before(:each) do
      click_link 'Office Payments'
    end
    it 'should contain page heading' do
      expect(page).to have_content 'Office Payments'
    end
    it 'should contain sign out button' do
      expect(page).to have_content 'Sign out'
    end
    
    it 'should have transaction amount' do
      expect(page).to have_content '$0'
    end
  end

  describe 'Testing new view of transaction' do
    before(:each) do
      click_link 'Office Payments'
      click_link 'New record'
    end
    it 'should have heading' do
      expect(page).to have_content 'New Record'
    end
    it 'should have name field' do
      expect(page).to have_field(type: 'text')
    end
    it 'should have submit field' do
      expect(page).to have_button(type: 'submit')
    end
  end
end