require 'rails_helper'
RSpec.describe Book, :type => :model do
    before do
        @book=FactoryGirl.create(:book)
    end
    describe "creation" do
        it "can be created if valid" do
          expect(@book).to be_valid
        end
#   subject { 
#     described_class.new(
#     bookname: "Anything",
#     author: "Anything",
#     description: "Anything",
#     availablecopy: "Anything",
#     copy: "Anything",
#     created_at: DateTime.now,
#     updated_at: DateTime.now + 1.week,
#     id: 1
#     )
#  }
 #let(:book) {FactoryGirl.create(:book)}
  it "is valid with valid attributes" do
    expect(@book).to be_valid
  end
  it "is not valid without a bookname"  do
    @book.bookname = nil
    expect(@book).to_not be_valid
  end
  it "is not valid without a author"  do
    @book.author= nil
    expect(@book).to_not be_valid
  end
  it "is not valid without a description"  do
    @book.description= nil
    expect(@book).to_not be_valid
  end
  it "is not valid without a copy"  do
    @book.copy= nil
    expect(@book).to_not be_valid
  end
  it "is not valid without a availablecopy"  do
    @book.availablecopy= nil
    expect(@book).to_not be_valid
  end
  it "is not valid without a created_at" do
    @book.created_at= nil
    expect(@book).to_not be_valid
  end
  it "is not valid without a updated_at" do
    @book.updated_at= nil
    expect(@book).to_not be_valid
  end
it { should have_many(:borrows) }
it { should have_many(:students) }
it { should have_many(:reservations) }
it { should have_many(:students).through(:reservations) }
end

end