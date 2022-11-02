FactoryBot.define do
    factory :borrow do
        # id {2}
        returned {"-"}
        created_at {"23-3-2022"}
        updated_at {"23-3-2022"}
        association :book
        association :student
    end
    # factory :borrow2, class: "Borrow" do
    #     book
    #     student
    # end
end