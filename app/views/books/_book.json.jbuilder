json.extract! book, :bookname, :description, :author, :copy, :availablecopy, :created_at, :updated_at
json.url book_url(book, format: :json)
