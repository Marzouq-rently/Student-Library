FactoryGirl.define do
    factory :borrow do
        id "3"
        created_at "23-3-2022"
        updated_at "23-3-2022"
        book_id {FactoryGirl.create(:book).id}
        student_id {FactoryGirl.create(:student).id} 
    end
    # factory :borrow2, class: "Borrow" do
    #     book
    #     student
    # end
end