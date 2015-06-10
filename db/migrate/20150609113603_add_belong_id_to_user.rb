class AddBelongIdToUser < ActiveRecord::Migration
  def change
    add_column :users, :belong_id, :integer
  end
end
