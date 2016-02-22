class Tweet < ActiveRecord::Base
  validates :text, length: {minimum: 1, maximum: 140}
  validates :user, length: {minimum: 1}
end
