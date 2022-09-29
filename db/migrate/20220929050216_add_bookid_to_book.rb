class AddBookidToBook < ActiveRecord::Migration[7.0]
  def change
    add_column :books, :bookid, :string
  end
end
