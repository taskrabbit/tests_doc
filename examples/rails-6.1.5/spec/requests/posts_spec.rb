require 'rails_helper'

RSpec.describe 'Post', type: :request do
  subject! { user.posts.create! title: 'Title', body: 'Body' }

  let(:user) { User.create! first_name: 'First', last_name: 'Last', email: 'demo@example.com' }

  describe 'GET /posts' do
    it 'renders posts' do
      recording_api_interaction do
        get posts_path
        expect(response.status).to be(200)
      end
    end

    it 'renders posts with filter' do
      recording_api_interaction do |options|
        options.key = 'with-filter'

        get posts_path(published: true)
        expect(response.status).to be(200)
      end
    end
  end

  describe 'GET /posts/:id' do
    it 'renders posts with id' do
      recording_api_interaction do |options|
        options.path = 'posts/@id'

        get post_path(subject.id)
        expect(response.status).to be(200)
      end
    end
  end
end
