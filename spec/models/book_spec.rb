require 'rails_helper'
RSpec.describe Book, :type => :model do
    before do
        @book=FactoryBot.create(:book)
    end
    describe "creation" do
        it "can be created if valid" do
          expect(@book).to be_valid
        end
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
it { should have_many(:borrows) }
it { should have_many(:students) }
it { should have_many(:reservations) }
it { should have_many(:students).through(:reservations) }
end

end