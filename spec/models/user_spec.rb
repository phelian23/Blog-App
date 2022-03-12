require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'User validations' do
    subject { User.new(name: 'Dupe', photo: 'dupe.png', bio: 'Student.', posts_counter: 0) }

    before { subject.save }

    it 'Check name should be present' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'User should have post greater than or equal to 0' do
      subject.posts_counter = -1
      expect(subject).to_not be_valid
    end

    it 'User should have post greater than or equal to 0' do
      subject.posts_counter = 0
      expect(subject).to be_valid
    end
  end

  describe 'Should test recent post method' do
    before { 4.times { |post| Post.create(user_id: subject.id, title: "This is post #{post}") } }

    it 'User should have three recent posts' do
      expect(subject.recent_posts).to eq(subject.posts.last(3))
    end
  end
end
