class CreateWraps < ActiveRecord::Migration[5.2]
  def change
    create_table :wraps do |t|
      t.string :precaution_title
      t.text :precaution_content
      t.date :start_time, null: false
      t.references :pet, foreign_key: true
      t.timestamps
    end
    add_index :wraps, :start_time
  end
end
