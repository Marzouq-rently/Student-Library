require 'rails_helper'

RSpec.describe BorrowsController, type: :controller do
    # subject{
    #     create(:borrow)
    # }
    context "if student is authenticated then" do
        it "render index page" do
            sign_in create(:student)
            borrow=create(:borrow)
            expect(get: '/borrows').to route_to(controller: 'borrows', action: 'index')
        end
    end

end