class CreatePets < ActiveRecord::Migration[5.2]
  def change
    create_table :pets do |t|
      t.string :name, null: false
      t.date :birthday
      t.integer :gender
      t.string :species
      t.text :memo
      t.string :icon
      t.timestamps
    end
  end
end
