require 'rails_helper'

RSpec.describe BooksController, type: :controller do
    # describe "requires login" do |path, student_type|
    #     context "when not logged in" do
    #       it "redirects to root path" do
    #         get public_send("#{path}_path")
      
    #         expect(response).to redirect_to root_path
    #       end
    #     end
      
    #     context "as an #{student_type}" do
    #       it "redirects to root path" do
    #         sign_in create(student_type)
      
    #         get public_send("#{path}_path")
      
    #         expect(response).to redirect_to root_path
    #       end
    #     end
    #   end
    #     context "when not logged in" do
    #         it "redirects to root page" do
    #           get root_path
    #           expect(response).to redirect_to root_path
    #         end
    #     end
    # describe "GET index" do
    #     context "when logged in" do
    #         before { sign_in create(:student) }
    #         it 'assigns @books' do
    #             book=Book.create
    #             respond_to do |format|
    #             format.html(index)
    #             expect(assigns(:books)).to eq([book])
    #         end
    #     end
    # end
    subject{
        create(:book)
    }
    context "if student is authenticated then" do
        it "render index page" do
            sign_in create(:student)
            book=create(:book)
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
end