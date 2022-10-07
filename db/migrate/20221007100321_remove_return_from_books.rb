class RemoveReturnFromBooks < ActiveRecord::Migration[7.0]
  def change
    remove_column :books, :return, :string
  end
end
