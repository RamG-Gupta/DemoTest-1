class Event < ApplicationRecord
  

	has_many :user_events, dependent: :destroy
	has_many :users, through: :user_events

  has_many :posts, dependent: :destroy
  has_many :likes, as: :likable


end
