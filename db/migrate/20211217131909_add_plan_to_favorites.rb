class AddPlanToFavorites < ActiveRecord::Migration[6.1]
  def change
    add_reference :favorites, :plan, foreign_key: true
  end
end
