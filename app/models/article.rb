class Article < ApplicationRecord
  belongs_to :user
  #ensure that every article is created it must have a user
  validates :user_id, presence: true
  validates :title, presence: true, length: { minimum: 3, maximum: 50 }
  validates :description, presence: true, length: { minimum: 10, maximum: 300 }
end