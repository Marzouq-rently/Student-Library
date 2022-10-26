class AddAuthorToBook < ActiveRecord::Migration[7.0]
  def change
    add_column :books, :author, :text
  end
end
