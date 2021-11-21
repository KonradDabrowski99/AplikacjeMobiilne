class CreateExercises < ActiveRecord::Migration[6.1]
  def change
    create_table :exercises do |t|
      t.string :description
      t.string :type_of_exercise

      t.timestamps
    end
  end
end
