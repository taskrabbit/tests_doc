require 'rails_helper'

RSpec.describe "Posts", :type => :request do
  describe "GET /posts" do
    it "renders posts" do
      recording_api_interaction do
        get posts_path
        expect(response.status).to be(200)
      end
    end

    it "renders posts with filter" do
      recording_api_interaction do |options|
        options.key = 'with-filter'
        get posts_path(published: true)
        expect(response.status).to be(200)
      end
    end
  end

  describe "GET /posts/:id" do
    it "renders posts with id" do
      User.create
      Post.create(user_id: User.first.id)

      recording_api_interaction do |options|
        options.path = 'posts/@id'
        get post_path(Post.first.id)
        expect(response.status).to be(200)
      end
    end
  end
end
