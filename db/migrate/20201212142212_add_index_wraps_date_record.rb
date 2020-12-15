class AddIndexWrapsDateRecord < ActiveRecord::Migration[5.2]
  def change
    add_index :wraps, :date_record, unique: true
  end
end
