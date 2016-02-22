class TweetsController < ApplicationController
  skip_before_action :verify_authenticity_token
  def create
    @tweet = Tweet.create(tweet_params)
    if @tweet.valid?
      respond_to do |f|
        f.json { render json: @tweet.to_json }
        f.xml { render xml: @tweet.to_xml }
      end
    else
      respond_to do |f|
        f.json { render json: { invalid: @tweet.errors.messages }, status: :bad_request }
        f.xml { render xml: { invalid: @tweet.errors.messages }, status: :bad_request }
      end
    end
  end

  private
  def tweet_params
    params.require(:tweet).permit(:text, :user, :tweeted_at)
  end
end
