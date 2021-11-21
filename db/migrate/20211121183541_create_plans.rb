class CreatePlans < ActiveRecord::Migration[6.1]
  def change
    create_table :plans do |t|
      t.string :plan_name
      t.boolean :public

      t.timestamps
    end
  end
end
