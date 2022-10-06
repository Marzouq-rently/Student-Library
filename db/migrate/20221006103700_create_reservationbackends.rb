class CreateReservationbackends < ActiveRecord::Migration[7.0]
  def change
    create_table :reservationbackends do |t|

      t.timestamps
    end
  end
end
