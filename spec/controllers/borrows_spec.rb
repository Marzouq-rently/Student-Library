require 'rails_helper'

RSpec.describe BorrowsController, type: :controller do
    subject{
        create(:student)
    }
    context "if student is authenticated then" do
        it "create borrow" do
            sign_in :subject
            borrow=create(:borrow)
            expect(get: '/borrows').to route_to(controller: 'borrows', action: 'index')
        end
    end

end