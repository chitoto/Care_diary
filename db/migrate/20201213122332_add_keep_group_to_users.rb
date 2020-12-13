class AddKeepGroupToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :keep_group_id, :integer
  end
end
