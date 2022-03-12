require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'Comment validations' do
    first_user = User.new(name: 'Tammy', photo: 'Tammy.png', bio: 'bio', posts_counter: 0)
    post = Post.new(title: 'Test post', text: 'Hi Temmy', user: first_user, likes_counter: 0, comments_counter: 0)

    before { post.save }

    it 'add some comments' do
      comment_creator = User.new(name: 'Dupe', photo: 'Dupe.png', bio: 'bio', posts_counter: 0)
      post.comments.create!(text: 'Hello World', user: comment_creator)
      post.comments.create!(text: 'This is my second post', user: comment_creator)
      post.comments.create!(text: 'This is my third post', user: comment_creator)
      expect(post.comments.length).to eql(3)
    end

    it 'Validates post' do
      expect(post).to be_valid
    end
  end
end
