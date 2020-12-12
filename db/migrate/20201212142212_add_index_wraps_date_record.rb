class AddIndexWrapsDateRecord < ActiveRecord::Migration[5.2]
  def change
    add_index :wraps, :date_record
  end
end
