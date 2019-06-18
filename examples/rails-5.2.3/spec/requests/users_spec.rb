require 'rails_helper'

RSpec.describe "Users", :type => :request do
  describe "GET /users" do
    it "renders users" do
      recording_api_interaction do
        get users_path
        expect(response.status).to be(200)
      end
    end
  end

  describe "GET /users/:user_id/posts" do
    it "renders posts" do
      User.create

      recording_api_interaction do |options|
        options.path = 'users/@id/posts'
        get user_posts_path(User.first.id)
        expect(response.status).to be(200)
      end
    end
  end
end
