class AddCopyToBooks < ActiveRecord::Migration[7.0]
  def change
    add_column :books, :copy, :integer
  end
end
