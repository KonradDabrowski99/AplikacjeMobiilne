class Plan < ApplicationRecord
    has_and_belongs_to_many :exercises, :join_table =>
    :plans_exercises
    belongs_to :user

    has_many :favorites
    has_many :trainings

  end
