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

end