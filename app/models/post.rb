class Post < ApplicationRecord
  belongs_to :event
  belongs_to :user
  has_many :likes, as: :likable
end
