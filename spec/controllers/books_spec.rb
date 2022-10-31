require 'rails_helper'

RSpec.describe BooksController, type: :controller do
    subject{
        create(:book)
    }

    context "if student is authenticated then" do
        it "render index page" do
            sign_in create(:student)
            book=create(:book)
            expect(build(:book)).to eq(book)
            expect(get: '/books').to route_to(controller: 'books', action: 'index')
            #expect(response).to render_template("index")
        end
        it "shows the specfic book" do
            expect(get: "/books/3").to route_to( :controller => "books", :action => "show", :id => "3" )
        end
        it "creates books" do
            sign_in :subject
            # borrow=create(:borrow)
            expect(get: '/books/new').to route_to(controller: 'books', action: 'new')
        end 
        it "updates the book" do
            expect(get: "/books/update").to route_to( :controller => "books", :action => "show", :id => "update" )
        end
    end
    # context "if student is not authenticated" do
    #     it "redirects to sign in page" do
    #         #expect(get:"/books").to have_http_status(302)
    #         expect(get:"/books").to redirect_to("/students/sign_in")
    #     end
    # end
end