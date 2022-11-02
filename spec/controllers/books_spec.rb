require 'rails_helper'

RSpec.describe BooksController, type: :controller do
    subject{
        create(:book)
    }

    context "if student is authenticated then" do
        it "render index page" do
            sign_in create(:student)
            book=create(:book)
            expect(get: '/books').to route_to(controller: 'books', action: 'index')
        end
        it "shows the specfic book" do
            expect(get: "/books/3").to route_to( :controller => "books", :action => "show", :id => "3" )
        end
        it "creates books" do
            sign_in :subject
            expect(get: '/books/new').to route_to(controller: 'books', action: 'new')
        end 
        it "updates the book" do
            expect(get: "/books/update").to route_to( :controller => "books", :action => "show", :id => "update" )
        end
    end

end