require 'rails_helper'

RSpec.describe Reservation, :type => :model do
    let(:book){FactoryBot.create(:book)}
    let(:reservation) {FactoryBot.create(:reservation)}
    it "is not valid when no bookid" do
        reservation.book_id=nil
        expect(reservation).to_not be_valid()
    end

    it "is not valid when no studentid" do
        reservation.student_id=nil
        expect(reservation).to_not be_valid()
    end
    it "is not valid when status is nil" do
        reservation.status=nil
        expect(reservation).to_not be_valid()
    end

    it "is not reserved when it is already existed" do
        b=Reservation.new
        b.book_id = reservation.book_id
        b.student_id = reservation.student_id
        b.status = reservation.status
        b.save
        expect(b.errors).to_not be_empty
    end

    it "is reserved when it is not existed" do
        expect(reservation.errors).to be_empty
    end

    it " runs checking_copy after update callback" do
        expect(reservation).to receive(:checking_copy)
        reservation.run_callbacks(:update)
    end
    it "checking the method checking copy if available copy is zero" do
        book.update(:availablecopy=>0)
        reservation=FactoryBot.create(:reservation, book_id:book.id)
        reservation.update(:status=>"Borrowed")
        borrow=Borrow.count
        expect(borrow).to eq(0)

    end
    it "checking the method checking copy if available copy is not zero" do
        reservation.update(:status=>"Borrowed")
        borrow=Borrow.count
        expect(borrow).to eq(1)

    end

it { should belong_to(:student) }
it { should belong_to(:book) }
end