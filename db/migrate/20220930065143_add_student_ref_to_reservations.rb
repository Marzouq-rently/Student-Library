class AddStudentRefToReservations < ActiveRecord::Migration[7.0]
  def change
    add_reference :reservations, :student, null: false, foreign_key: true
  end
end
