require 'rails_helper'
RSpec.describe "Books", :type => :request do
    context "when authorized " do
        let(:apiapplication) { FactoryBot.create(:apiapplication) }
        let(:student)        { FactoryBot.create(:student) }
        let(:token)       { FactoryBot.create(:access_token, application: apiapplication, resource_owner_id: student.id) }

        it "creates a new book" do
            post "/api/books", params: {book: {bookname: "Hello World", author: "Charles Babbage", description: "computer-science",copy:2, availablecopy: 2}},
               headers: { 'Authorization': 'Bearer ' + token.token }
              expect(response).to have_http_status(200)
        end

        it "shows books available for issue" do
            book = create(:book)
            get "/api/books", params: {}, headers: {'Authorization': 'Bearer ' + token.token}
            res = JSON.parse(response.body)
            expect(response).to have_http_status(200)   
        end

        it "updates book details successfully" do
            book = create(:book)
            put "/api/books/#{book.id}", params: {book: {availablecopy: 2}}, headers: { 'Authorization': 'Bearer ' + token.token }
            expect(response).to have_http_status(200)
        end

        it "deletes a book successfully" do
            book = create(:book)
            delete "/api/books/#{book.id}", params: {}, headers: { 'Authorization': 'Bearer ' + token.token }
            expect(response).to have_http_status(200)
        end
    
    end
end