class AddStudentToBorrowbackends < ActiveRecord::Migration[7.0]
  def change
    add_reference :borrowbackends, :student, null: false, foreign_key: true
  end
end
