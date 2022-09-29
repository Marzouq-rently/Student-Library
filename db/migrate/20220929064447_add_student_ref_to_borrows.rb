class AddStudentRefToBorrows < ActiveRecord::Migration[7.0]
  def change
    add_reference :borrows, :student, null: false, foreign_key: true
  end
end
