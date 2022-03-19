require 'rails_helper'

RSpec.describe 'User #Show', type: :feature do
  describe 'shows users' do
    before(:each) do
      @user1 = User.create(name: 'Jumoke', bio: 'Developer', email: 'jumy@example.com', password: 'password', posts_counter: 0, confirmed_at: Time.now)
      @user2 = User.create(name: 'Shade', bio: 'Dancer', email: 'shaddy@example.com', password: 'password', posts_counter: 0, confirmed_at: Time.now)

      visit root_path
      fill_in 'Email', with: 'jumy@example.com'
      fill_in 'Password', with: 'password'
      click_button 'Log in'
      @post1 = Post.create(title: 'First Post', text: 'Hello', comments_counter: 0, likes_counter: 0, user: @user1)
      @post2 = Post.create(title: 'Second Post', text: 'Hello 2', comments_counter: 0, likes_counter: 0, user: @user1)
      @post3 = Post.create(title: 'Third Post', text: 'Hello 3', comments_counter: 0, likes_counter: 0, user: @user1)
      @post4 = Post.create(title: 'Fourth Post', text: 'Hello 4', comments_counter: 0, likes_counter: 0, user: @user1)
      visit user_path(@user1.id)
    end
    it "show user's profile picture" do
      expect(page).to have_css('img')
    end

    it "show user's name" do
      expect(page).to have_content 'Jumoke'
    end

    it 'show number of posts per user' do
      user = User.first
      expect(page).to have_content(user.posts_counter)
    end

    it "show user's bio." do
      expect(page).to have_content('Bio')
      visit user_session_path
    end

    it "show user's first 3 posts." do
      expect(page).to have_content 'Hello'
      expect(page).to have_content 'Hello 2'
      expect(page).to have_content 'Hello 3'
    end

    it "show link to all of a user's posts." do
      expect(page).to have_link('See all posts')
    end

    it "click see all posts and redirects to user's post's index page." do
      click_link 'See all posts'
      expect(page).to have_current_path user_posts_path(@user1)
    end
  end
end
