require 'rails_helper'

RSpec.describe BooksController, type: :controller do
    subject{
        create(:book)
    }
    context "if student is authenticated then" do
        it "render index page" do
            sign_in create(:student)
            book=create(:book)
            # debugger
            #get("books").should route_to("books#index")
            # get :index
            expect(get: '/books').to route_to(controller: 'books', action: 'index')
            #expect(response).to render_template("index")
        end
        it "route test" do
            assert_generates "/books/3", { :controller => "books", :action => "show", :id => "3" }

        end
        # it "show book details" do
        #     student= create(:student)
        #     sign_in student
        #     book=create(:book)
            # create(:bookname, :author, :description, :copy, :availablecopy, :created_at, :updated_at)
            # expect(get: '/books').to route_to(controller: 'books', action: 'show')
            # it { should route(:get, '/books/3').to(action: :show, id: 3) }
            # , params: {bookname: book.bookname}
        # end
    end    
end