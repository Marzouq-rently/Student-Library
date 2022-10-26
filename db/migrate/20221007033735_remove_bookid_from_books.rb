class RemoveBookidFromBooks < ActiveRecord::Migration[7.0]
  def change
    remove_column :books, :bookid, :text
  end
end
