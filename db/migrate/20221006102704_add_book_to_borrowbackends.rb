class AddBookToBorrowbackends < ActiveRecord::Migration[7.0]
  def change
    add_reference :borrowbackends, :book, null: false, foreign_key: true
  end
end
