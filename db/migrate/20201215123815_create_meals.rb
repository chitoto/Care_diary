class CreateMeals < ActiveRecord::Migration[5.2]
  def change
    create_table :meals do |t|
      t.time :start_time
      t.string :shape
      t.string :amount
      t.text :memo
      t.references :wrap, foreign_key: true
      t.timestamps
    end
  end
end
