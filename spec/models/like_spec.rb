require 'rails_helper'

RSpec.describe Like, type: :model do
  it 'tests that Like model is created correctly' do
    like = Like.new
    like.build_user(name: 'Lolade')
    like.build_post(text: 'new post 2')
    expect(like).to be_valid
  end
end
