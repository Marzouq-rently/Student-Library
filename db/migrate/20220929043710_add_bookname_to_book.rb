class AddBooknameToBook < ActiveRecord::Migration[7.0]
  def change
    add_column :books, :bookname, :text
  end
end
