class Manager < ApplicationRecord
  has_secure_password

  validates :username, presence: true
  validates :password, presence: true, length: { minimum: 6 }
end
