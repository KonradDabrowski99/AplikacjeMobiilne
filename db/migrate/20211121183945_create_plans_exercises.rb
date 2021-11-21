class CreatePlansExercises < ActiveRecord::Migration[6.1]
  def change
    create_table :plans_exercises, id: false do |t|
      t.belongs_to :exercise, index: true
      t.belongs_to :plan, index: true
      t.timestamps
    end
  end
end
