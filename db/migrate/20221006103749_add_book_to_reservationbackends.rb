class AddBookToReservationbackends < ActiveRecord::Migration[7.0]
  def change
    add_reference :reservationbackends, :book, null: false, foreign_key: true
  end
end