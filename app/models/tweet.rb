class Tweet < ActiveRecord::Base
  validates :text, length: {minimum: 1, maximum: 140}
  validates :user, length: {minimum: 1}

  def self.average_tweets()
    # result = []
    # 0.upto 23 do |hour|
    #   sql = "SELECT AVG(c.count) FROM(SELECT COUNT(*) FROM tweets WHERE extract(hour from tweets.tweeted_at) = #{hour} GROUP BY extract(day from tweets.tweeted_at), extract(month from tweets.tweeted_at), extract(year from tweets.tweeted_at)) AS c"
    #   average = Tweet.connection.select_all(sql).rows[0][0]
    #   result << average
    # end
    # result
    sql = "SELECT COUNT(*), extract(hour from tweets.tweeted_at) AS hour FROM tweets GROUP BY hour ORDER BY hour"
    averages = Tweet.connection.select_all(sql).map { |r| { count: r["count"].to_f/(Time.now-Tweet.order(:tweeted_at).first.tweeted_at).days, hour: r["hour"] } }
    averages
  end
end
