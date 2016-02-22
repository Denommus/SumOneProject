require 'rails_helper'

RSpec.describe TweetsController, type: :controller do
  describe "POST /tweets" do
    it "creates a valid tweet" do
      expect {
        post :create, format: :json, tweet: { user: "Yuri", text: "a", tweeted_at: Time.now }
      }.to change(Tweet, :count).by(1)
    end

    it "raises an exception on invalid tweet" do
      post :create, format: :json, tweet: { user: "", text: "", tweeted_at: Time.now }
      expect(response).to be_bad_request
    end
  end
end
