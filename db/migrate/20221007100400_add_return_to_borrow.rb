class AddReturnToBorrow < ActiveRecord::Migration[7.0]
  def change
    add_column :borrows, :return, :text
  end
end
