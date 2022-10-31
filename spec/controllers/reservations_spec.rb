require 'rails_helper'

RSpec.describe BorrowsController, type: :controller do
    subject{
        create(:student)
    }
    context "if the student is authenticated then" do
        it "should update the reservation" do
            sign_in :subject
            expect(get: 'reservations/update').to route_to(controller: 'reservations', action: 'show', id:'update')
        end 
    end
end