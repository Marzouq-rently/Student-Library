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
        context "when not logged in" do
            it "redirects to root page" do
              get root_path
              expect(response).to redirect_to root_path
            end
        end
    describe "GET index" do
        context "when logged in" do
            before { sign_in create(:student) }
            it 'assigns @books' do
                book=Book.create
                respond_to do |format|
                format.html(index)
                expect(assigns(:books)).to eq([book])
            end
        end
    end
    # subject{
    #     create(:book)
    # }
    # context "if student is authenticated then" do
    #     it "render index page" do
    #         sign_in create(:student)
    #         book=create(:book)
    #         # debugger
    #         #get("books").should route_to("books#index")
    #         # get :index
    #         expect(get: '/books').to route_to(controller: 'books', action: 'index')
    #         #expect(response).to render_template("index")
    #     end
    #     it "route test" do
    #         assert_generates "/books/3", { :controller => "books", :action => "show", :id => "3" }

    #     end
    #     # it "show book details" do
    #     #     student= create(:student)
    #     #     sign_in student
    #     #     book=create(:book)
    #         # create(:bookname, :author, :description, :copy, :availablecopy, :created_at, :updated_at)
    #         # expect(get: '/books').to route_to(controller: 'books', action: 'show')
    #         # it { should route(:get, '/books/3').to(action: :show, id: 3) }
    #         # , params: {bookname: book.bookname}
    #     # end
    # end    
end