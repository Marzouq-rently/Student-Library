class DropReservationbackends < ActiveRecord::Migration[7.0]
  def change
    drop_table :reservationbackends
  end
end
