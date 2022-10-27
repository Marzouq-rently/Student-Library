require 'rails_helper'

RSpec.describe Borrow, :type => :model do
    # let (:book) {FactoryGirl.create(:book)}
    borrow=FactoryBot.build(:borrow)
    it "is not valid when no bookid" do
        #@borrow.book_id = nil
        borrow=FactoryBot.build(:borrow, book_id: nil) 
        # expect(borrow.valid?).to_be false
        expect(borrow).to_not be_valid()
    end
    # let (:student) {FactoryGirl.create(:student)}
    it "is not valid when no studentid" do
        #@borrow.student_id= nil
        borrow=FactoryBot.build(:borrow, student_id: nil)
        expect(borrow).to_not be_valid()
    end



    # before do
    #     @borrow=FactoryGirl.create(:borrow)
    # end
    # describe 'creation' do

    #     it 'is valid when valid' do
    #         expect(@borrow).to be_valid
    #     end

    # end

#   it "is valid with valid attributes" do
#     expect(Borrow.new).to be_valid
#   end
#   it "is not valid without a student_id"  do
#     borrow = Borrow.new(student_id: nil)
#     expect(borrow).to_not be_valid
#   end
#   it "is not valid without a return"  do
#     borrow = Borrow.new(return: nil)
#     expect(borrow).to_not be_valid
#   end
#   it "is not valid without a book_id"  do
#     borrow = Borrow.new(book_id: nil)
#     expect(borrow).to_not be_valid
#   end
#   it "is not valid without a start_date"
#   it "is not valid without a end_date"
it { should belong_to(:student) }
it { should belong_to(:book) }
end