require 'rails_helper'

RSpec.describe 'User', type: :request do
  subject! { User.create! first_name: 'First', last_name: 'Last', email: 'demo@example.com' }

  describe 'GET /users' do
    it 'renders users' do
      recording_api_interaction do
        get users_path
        expect(response.status).to be(200)
      end
    end
  end

  describe 'GET /users/:user_id/posts' do
    before { subject.posts.create! title: 'Title', body: 'Body' }

    it 'renders posts' do
      recording_api_interaction do |options|
        options.path = 'users/@id/posts'

        get user_posts_path(subject.id)
        expect(response.status).to be(200)
      end
    end
  end
end
