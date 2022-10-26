class AddReturnToBook < ActiveRecord::Migration[7.0]
  def change
    add_column :books, :return, :text
  end
end
