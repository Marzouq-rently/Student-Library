class CreateBorrowbackends < ActiveRecord::Migration[7.0]
  def change
    create_table :borrowbackends do |t|

      t.timestamps
    end
  end
end
