class RenameBorrowsReturn < ActiveRecord::Migration[7.0]
  def change
    rename_column :borrows, :return, :returned
  end
end
