require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    before(:example) { get user_posts_path(1) }

    it 'Test if action returns correct response status' do
      expect(response).to have_http_status(:ok)
    end

    it 'Test if action rendered a correct template' do
      expect(response).to render_template('index')
    end

    it 'Test if correct placeholder is shown' do
      expect(response.body).to include('Posts index...')
    end
  end

  describe 'GET /show' do
    before(:example) { get user_post_path(1, 2) }

    it 'Test if action returns correct response status' do
      expect(response).to have_http_status(:ok)
    end

    it 'Test if action rendered a correct template' do
      expect(response).to render_template('show')
    end

    it 'Test if correct placeholder is shown' do
      expect(response.body).to include('Show post')
    end
  end
end
