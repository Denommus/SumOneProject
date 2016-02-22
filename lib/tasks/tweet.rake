namespace :tweet do
  desc "Calculates the average of tweets hourly"
  task average: :environment do
    Tweet.average_tweets.each do |t|
      puts format_hour(t[:hour].to_i) + " -> " + t[:count].to_s
    end
  end

  desc "Calculates the user with the biggest number of tweets"
  task biggest: :environment do
  end

  private
  def format_hour(hour)
    (hour<10 ? "0" : "") + hour.to_s + ":00"
  end
end
