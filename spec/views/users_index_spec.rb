require 'rails_helper'

describe 'user index page tests', type: :feature do
  before :each do
    @user1 = User.create(name: 'User1', bio: 'Dancer', email: 'user@example.com', password: 'password',
                         posts_counter: 0, confirmed_at: Time.now)
    @user2 = User.create(name: 'Shade', bio: 'Developer', email: 'shaddy@example.com', password: 'password',
                         posts_counter: 0, confirmed_at: Time.now)
  end

  it 'shows all users' do
    visit root_path
    within('body') do
      fill_in 'Email', with: 'user@example.com'
      fill_in 'Password', with: 'password'
    end
    click_button 'Log in'
    expect(page).to have_content 'User1'
    expect(page).to have_content 'Shade'
  end

  it 'number of posts visible' do
    visit root_path
    within('body') do
      fill_in 'Email', with: 'user@example.com'
      fill_in 'Password', with: 'password'
    end
    click_button 'Log in'
    expect(page).to have_content 'Number of posts: 0'
  end

  it 'profile images show up' do
    visit root_path
    within('body') do
      fill_in 'Email', with: 'user@example.com'
      fill_in 'Password', with: 'password'
    end
    click_button 'Log in'
    expect(page).to have_css('img')
  end
end
