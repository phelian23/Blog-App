require 'rails_helper'

describe 'user post index page tests', type: :feature do
  before :each do
    @user1 = User.create(name: 'Shakiru', bio: 'Mechanic', email: 'user1@example.com', password: 'password', posts_counter: 0, confirmed_at: Time.now)
    @user2 = User.create(name: 'Jinadu', bio: 'Developer', email: 'user2@example.com', password: 'password', posts_counter: 0, confirmed_at: Time.now)
    @post1 = Post.create(title: 'First Post', text: 'Hello', comments_counter: 0, likes_counter: 0, user: @user1)
    @post2 = Post.create(title: 'Second Post', text: 'How are you', comments_counter: 0, likes_counter: 0, user: @user1)
    @post3 = Post.create(title: 'Third Post', text: 'Hi', comments_counter: 0, likes_counter: 0, user: @user1)
    @comment1 = Comment.create(text: 'Keep it up!', user: User.first, post: Post.first)
  end

  it 'shows user profile image' do
    visit root_path
    within('body') do
      fill_in 'Email', with: 'user1@example.com'
      fill_in 'Password', with: 'password'
    end
    click_button 'Log in'
    visit(user_posts_path(@user1.id))
    expect(page).to have_css('img')
  end

  it 'user username visible' do
    visit root_path
    within('body') do
      fill_in 'Email', with: 'user1@example.com'
      fill_in 'Password', with: 'password'
    end
    click_button 'Log in'
    visit(user_posts_path(@user1.id))

    expect(page).to have_content 'Shakiru'
  end

  it 'shows number of posts' do
    visit root_path
    within('body') do
      fill_in 'Email', with: 'user1@example.com'
      fill_in 'Password', with: 'password'
    end
    click_button 'Log in'
    visit(user_posts_path(@user1.id))
    post = Post.all
    expect(post.size).to eql(3)
  end

  it 'shows number of posts of a user' do
    visit root_path
    within('body') do
      fill_in 'Email', with: 'user1@example.com'
      fill_in 'Password', with: 'password'
    end
    click_button 'Log in'
    visit(user_posts_path(@user1.id))

    user = User.first
    expect(page).to have_content(user.posts_counter)
  end

  it 'see number of likes' do
    visit root_path
    within('body') do
      fill_in 'Email', with: 'user1@example.com'
      fill_in 'Password', with: 'password'
    end
    click_button 'Log in'
    visit(user_posts_path(@user1.id))

    expect(page).to have_content 'likes: 0'
  end

  it 'see number of comments' do
    visit root_path
    within('body') do
      fill_in 'Email', with: 'user1@example.com'
      fill_in 'Password', with: 'password'
    end
    click_button 'Log in'
    visit(user_posts_path(@user1.id))

    expect(page).to have_content 'Hello'
  end

  it 'shows commentor username' do
    visit root_path
    within('body') do
      fill_in 'Email', with: 'user1@example.com'
      fill_in 'Password', with: 'password'
    end
    click_button 'Log in'
    visit(user_posts_path(@user1.id))

    expect(page).to have_content 'Shakiru'
  end
end
