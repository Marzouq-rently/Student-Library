FactoryBot.define do
    factory :reservation do
        id {1}
        status {"Reserved"}
        created_at {"23-3-2022"}
        updated_at {"23-3-2022"}
        association :book
        association :student
    end
end