require 'rails_helper'

RSpec.describe Borrow, :type => :model do
    # let (:book) {FactoryGirl.create(:book)}
    it "is not valid when no bookid" do
        borrow=FactoryBot.build(:borrow, book_id: nil) 
        expect(borrow).to_not be_valid()
    end
    # let (:student) {FactoryGirl.create(:student)}
    it "is not valid when no studentid" do
        borrow=FactoryBot.build(:borrow, student_id: nil)
        expect(borrow).to_not be_valid()
    end
    it "is not valid when returned is nil" do
        borrow=FactoryBot.build(:borrow, returned: nil)
        expect(borrow).to_not be_valid
    end
it { should belong_to(:student) }
it { should belong_to(:book) }
end