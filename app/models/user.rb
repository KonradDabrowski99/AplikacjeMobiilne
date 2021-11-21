class User < ApplicationRecord
  has_many :trainings
  has_many :plans
  has_many :favourites
end
