require 'rails_helper'
RSpec.describe Student, :type => :model do
    before do
        @student=FactoryBot.create(:student)
    end
    describe "creation" do
        it "can be created if valid" do
          expect(@student).to be_valid
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
#  let(:student) {FactoryGirl.create(:student)}
  it "is valid with valid attributes" do
    expect(@student).to be_valid
  end
  it "is not valid without a email"  do
    @student.email = nil
    expect(@student).to_not be_valid
  end
  it "is not valid without a password"  do
    @student.password= nil
    expect(@student).to_not be_valid
  end
#   it "is not valid without a password confirmation"  do
#     @student.password_confirmation= nil
#     expect(@student).to_not be_valid
#   end
#   it "is not valid without a created_at" do
#     @student.created_at= nil
#    # debugger
#     expect(@student).to_not be_valid
#   end
#   it "is not valid without a updated_at" do
#     @student.updated_at= nil
#     expect(@student).to_not be_valid
#   end
it { should have_many(:books)}
it { should have_many(:borrows) }
it { should have_many(:books).through(:reservations) }
it { should have_many(:reservations) }
end
end