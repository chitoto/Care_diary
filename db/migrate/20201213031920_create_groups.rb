class CreateGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :groups do |t|
      t.string :name, null: false, unique: true
      t.integer :owner_id, null: false
      t.string :icon
      t.timestamps
    end
  end
end
