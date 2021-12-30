class User < ApplicationRecord
  has_many :trainings
  has_many :plans
  has_many :favourites



  validates :first_name, presence: true, length: { in: 3..50 }
  validates :last_name, presence: true,  length: { in: 3..50 }
  validates :email, presence: true, uniqueness: true, length: { in: 3..50 }
  has_secure_password
  has_secure_token
  validates :password, presence:true, length: { minimum: 6 }


  def invalidate_token
    self.update_columns(token: nil)
  end
end
