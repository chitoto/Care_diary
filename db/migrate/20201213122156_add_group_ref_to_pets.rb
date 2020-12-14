class AddGroupRefToPets < ActiveRecord::Migration[5.2]
  def change
    add_reference :pets, :group, foreign_key: true
  end
end
