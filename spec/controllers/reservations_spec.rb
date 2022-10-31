require 'rails_helper'

RSpec.describe ReservationsController, type: :controller do
    subject{
        create(:student)
    }
    context "if the student is authenticated then" do
        it "should update the reservation" do
            sign_in :subject
            reservation=create(:reservation)
            reservation.status="Borrowed"
            expect(reservation.status).to eq("Borrowed")
            expect(get: 'reservations/update').to route_to(controller: 'reservations', action: 'show', id:'update')
        end 
    end
end