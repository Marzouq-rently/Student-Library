class AddStudentToReservationbackends < ActiveRecord::Migration[7.0]
  def change
    add_reference :reservationbackends, :student, null: false, foreign_key: true
  end
end
