require 'rails_helper'

RSpec.describe Borrow, :type => :model do    
    let(:borrow) {FactoryBot.create(:borrow)}
    it "is not valid when no bookid" do
        borrow.book_id=nil
        expect(borrow).to_not be_valid()
    end

    it "is not valid when no studentid" do
        borrow.student_id=nil
        expect(borrow).to_not be_valid()
    end
    it "is not valid when returned is nil" do
        borrow.returned=nil
        expect(borrow).to_not be_valid
    end

    it "is not borrowed when it is already existed" do
        b=Borrow.new
        b.book_id = borrow.book_id
        b.student_id = borrow.student_id
        b.returned = borrow.returned
        b.save
        expect(b.errors).to_not be_empty
    end

    it "is borrowed when it is not existed" do
        expect(borrow.errors).to be_empty
    end
    
    it "cannot return the same book" do
        borrow=FactoryBot.create(:borrow, returned:"Returned")
        borrow.update(:returned=>"Returned")
        expect(borrow.errors).to_not be_empty
    end

    it "is returned when it is updated from - to returned" do
        borrow=FactoryBot.create(:borrow)
        borrow.update(:returned=>"Returned")
        expect(borrow.errors).to be_empty
    end
it { should belong_to(:student) }
it { should belong_to(:book) }
end