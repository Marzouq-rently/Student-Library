require 'rails_helper'

RSpec.describe Reservation, :type => :model do
    # let (:book) {FactoryGirl.create(:book)}
    it "is not valid when no bookid" do
        reservation=FactoryBot.build(:reservation, book_id: nil) 
        expect(reservation).to_not be_valid()
    end
    # let (:student) {FactoryGirl.create(:student)}
    it "is not valid when no studentid" do
        reservation=FactoryBot.build(:reservation, student_id: nil)
        expect(reservation).to_not be_valid()
    end
    it "is not valid when status is nil" do
        reservation=FactoryBot.build(:reservation, status: nil)
        expect(reservation).to_not be_valid()
    end
it { should belong_to(:student) }
it { should belong_to(:book) }
end