class CreateMedicines < ActiveRecord::Migration[5.2]
  def change
    create_table :medicines do |t|
      t.time :start_time
      t.string :shape
      t.text :memo
      t.references :wrap, foreign_key: true
      t.timestamps
    end
  end
end
