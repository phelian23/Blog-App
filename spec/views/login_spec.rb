require 'rails_helper'

describe 'signing in process', type: :feature do
  before :each do
    @user1 = User.create(name: 'Tamilore', bio: 'Mechanic', email: 'user3@example.com', password: 'password', posts_counter: 0, confirmed_at: Time.now)
  end

  it 'log in page' do
    visit root_path
    expect(page).to have_content 'Log in'
    expect(page).to have_content 'Email'
    expect(page).to have_content 'Password'
  end

  it 'wrong log in details' do
    visit root_path
    within('body') do
      fill_in 'Email', with: 'user@example.com'
      fill_in 'Password', with: 'password'
    end
    click_button 'Log in'
    expect(page).to have_content 'Invalid Email or password'
  end

  it 'submit with no password' do
    visit root_path
    within('body') do
      fill_in 'Email', with: 'user@example.com'
      fill_in 'Password', with: ''
    end
    click_button 'Log in'
    expect(page).to have_content 'Invalid Email or password'
  end

  it 'submit with correct log in data' do
    @user4 = User.create(name: 'jomiloju', bio: 'Mechanic', email: 'user4@example.com', password: 'password', posts_counter: 0, confirmed_at: Time.now)

    visit root_path
    within('body') do
      fill_in 'Email', with: 'user4@example.com'
      fill_in 'Password', with: 'password'
    end
    click_button 'Log in'
    expect(page).to have_content 'jomiloju'
  end
end
