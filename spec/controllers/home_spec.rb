require 'rails_helper'
RSpec.describe HomeController, type: :controller do
    subject{
        create(:student)
    }
    context "if student is authenticated then" do
        it "render homepage" do
            sign_in subject
            expect(get: 'home/homepage').to route_to(controller: 'home', action: 'homepage')
        end    
        it "render header" do 
            sign_in subject
            expect(get: 'home/header').to route_to(controller: 'home', action: 'header')
        end
    end

    # context "if student is not authenticated then" do
    #     # it {should redirect_to root_path}
    #     it "redirect to sign_in page" do
    #         debugger
    #         expect(get: 'users/users').to route_to(controller: 'users', action: 'users')
    #     #     # expect(response).to have_http_status(302)
    #     #     assert_generates "/students/sign_in", {controller: 'devise', action: '/students/sign_in' }
    #     #     #expect(get: '/students').to redirect_to(controller: 'device', action: "/students/sign_in") 
    #     end
    # end

end