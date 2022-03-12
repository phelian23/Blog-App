require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'Post validations' do
    user1 = User.create(name: 'Lolade', bio: 'Public Administator', posts_counter: 0)
    subject do
      Post.new(title: 'This is my first post', text: 'Hello! omo iya e', user: user1, comments_counter: 3,
               likes_counter: 1)
    end

    before { subject.save }

    it 'Title should be present' do
      subject.title = nil
      expect(subject).to_not be_valid
    end

    it 'Title should not be greater than 250 characters' do
      expect(subject).to be_valid
    end

    it 'Comments counter should be integer' do
      subject.comments_counter = 2
      expect(subject).to be_valid
    end

    it 'Comments counter should be greater than or equal to 0' do
      subject.comments_counter = -1
      expect(subject).to_not be_valid
    end

    it 'Likes counter should be greater than or equal to 0' do
      subject.likes_counter = -1
      expect(subject).to_not be_valid
    end

    it 'Likes counter should be integer' do
      subject.likes_counter = 2.2
      expect(subject).to_not be_valid
    end
  end
end
