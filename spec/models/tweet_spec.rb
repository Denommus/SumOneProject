require 'rails_helper'

RSpec.describe Tweet, type: :model do
  context "Tweet unit testing" do
    it "shouldn't accept tweets over 140 characters" do
      expect(Tweet.new(text: "a" * 141, user: "Yuri")).to_not be_valid
    end

    it "shouldn't accept empty tweets" do
      expect(Tweet.new(text: "", user: "Yuri")).to_not be_valid
    end

    it "shouldn't accept empty usernames" do
      expect(Tweet.new(text: "a", user: "")).to_not be_valid
    end

    it "should accept a valid tweet" do
      expect(Tweet.new(text: "a", user: "Yuri")).to be_valid
    end
  end
end
