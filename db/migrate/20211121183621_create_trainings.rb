class CreateTrainings < ActiveRecord::Migration[6.1]
  def change
    create_table :trainings do |t|
      t.date :date
      t.float :status

      t.timestamps
    end
  end
end
