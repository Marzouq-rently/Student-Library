FactoryBot.define do
    factory :book do
      bookname {"book name"}
      author {"author name"}
      description {"book description"}
      availablecopy {4}
      copy {4}
      created_at {"23-2-2022"}
      updated_at {"23-2-2022"}
      id {3}

    end
    # factory :book2, class:"Book"  do
    #     bookname "book name2"
    #     author "author name2"
    #     description "book description2"
    #     availablecopy "available copies"
    #     copy "copies"
        
    #   end
  end