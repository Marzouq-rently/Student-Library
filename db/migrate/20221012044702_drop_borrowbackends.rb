class DropBorrowbackends < ActiveRecord::Migration[7.0]
  def change
    drop_table :borrowbackends
  end
end
