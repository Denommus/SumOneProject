class Tweet < ActiveRecord::Base
  validates :text, length: {minimum: 1, maximum: 140}
  validates :user, length: {minimum: 1}

  def self.average_tweets()
    sql = "SELECT COUNT(*), extract(hour from tweets.tweeted_at) AS hour FROM tweets GROUP BY hour ORDER BY hour"
    averages = Tweet.connection.select_all(sql).map { |r| { count: r["count"].to_f/(Time.now-Tweet.order(:tweeted_at).first.tweeted_at).days, hour: r["hour"] } }
    averages
  end
end
