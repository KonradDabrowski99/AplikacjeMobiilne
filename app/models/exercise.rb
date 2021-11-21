class Exercise < ApplicationRecord
  has_and_belongs_to_many :plans, :join_table =>
  :plans_exercises
end
