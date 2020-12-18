class CreateWraps < ActiveRecord::Migration[5.2]
  def change
    create_table :wraps do |t|
      t.string :precaution_title
      t.text :precaution_content
      t.date :date_record, null: false
      t.references :pet, foreign_key: true
      t.timestamps
    end
    add_index :wraps, :date_record
  end
end
