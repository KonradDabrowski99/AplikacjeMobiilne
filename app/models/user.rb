class User < ApplicationRecord
  has_many :trainings
  has_many :plans
  has_many :favourites

  has_secure_password

  validates :first_name, presence: true, uniqueness: true, length: { in: 3..50 }
  validates :last_name, presence: true, uniqueness: true, length: { in: 3..50 }
  validates :email, presence: true, uniqueness: true, length: { in: 3..50 }
  validates :password, presence:true, length: { minimum: 6 }
end
