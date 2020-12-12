class CreateConditions < ActiveRecord::Migration[5.2]
  def change
    create_table :conditions do |t|
      t.time :start_time
      t.float :weight
      t.float :temperature
      t.text :memo
      t.references :wrap, foreign_key: true
      t.timestamps
    end
  end
end
