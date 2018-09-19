class User < ApplicationRecord
  has_many :articles
  # before_save, take the email value and make it to a lowercase
  before_save { self.email = email.downcase }
  # case sensitive set to false to make sure, uniqeness for capitilization will be ignored
  validates :username, presence: true, 
            uniqueness: { case_sensitive: false }, 
            length: { minimum: 3, maximum: 25 }

  VALID_EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 105 }, 
            uniqueness: { case_sensitive: false }, 
            format: { with: VALID_EMAIL_REGEX }
            
  has_secure_password
end