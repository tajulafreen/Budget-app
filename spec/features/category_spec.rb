require 'rails_helper'

RSpec.describe 'categories/index', type: :feature do
  before(:each) do
    @user = User.create(id: '3', name: 'Hammas', email: 'hammas@gmail.com', password: 'hammas')
    # @user.confirm
    @category = Category.create(id: '3', name: 'Office Payments',
                                icon: 'https://avatars.githubusercontent.com/u/119053190?v=4', user: @user)
    visit new_user_session_path
    fill_in 'Email', with: 'hammas@gmail.com'
    fill_in 'Password', with: 'hammas'
    click_button 'Log in'
  end
  describe 'Testing index view of categories' do
    it 'should contain page heading' do
      expect(page).to have_content 'Categories'
    end
    it 'should contain sign out button' do
      expect(page).to have_content 'Sign Out'
    end
    it 'should have category name' do
      expect(page).to have_content 'Office Payments'
    end
    it 'should have category name' do
      expect(page).to have_content '$0'
    end
  end

  describe 'Testing new view of categories' do
    before(:each) { click_link 'Add a New Category' }
    it 'should have name field' do
      expect(page).to have_field(type: 'text')
    end
    it 'should have file field' do
      expect(page).to have_field(type: 'file')
    end
    it 'should have submit field' do
      expect(page).to have_button(type: 'submit')
    end
  end
end
