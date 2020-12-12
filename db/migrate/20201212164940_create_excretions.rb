class CreateExcretions < ActiveRecord::Migration[5.2]
  def change
    create_table :excretions do |t|
      t.time :start_time
      t.string :shape
      t.string :amount
      t.string :smell
      t.text :memo
      t.references :wrap, foreign_key: true
      t.timestamps
    end
  end
end
