class CreateWalks < ActiveRecord::Migration[5.2]
  def change
    create_table :walks do |t|
      t.time :start_time
      t.string :how_many
      t.text :memo
      t.references :wrap, foreign_key: true
      t.timestamps
    end
  end
end
