class AddPlanToTrainings < ActiveRecord::Migration[6.1]
  def change
    add_reference :trainings, :plan, foreign_key: true
  end
end
