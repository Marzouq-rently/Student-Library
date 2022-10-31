require 'rails_helper'

RSpec.describe BorrowsController, type: :controller do

    # subject{
    #     create(:student)
    # }
    # context "if student is authenticated then" do
    #     context "create borrow" do
    #         it "if available copy is not reduced" do
    #             sign_in :subject
    #             borrow=create(:borrow)
    #             book=build(:book)
    #             book.copy=book.availablecopy
    #             expect(borrow).to_not be_valid()
    #         end
    #         it "if available copy is reduced to 1" do
    #             sign_in :subject
    #             borrow=create(:borrow)
    #             book=build(:book)
    #             book.availablecopy=book.availablecopy-1
    #             expect(get: '/borrows').to route_to(controller: 'borrows', action: 'index')
    #         end
    #     end
    # end

end