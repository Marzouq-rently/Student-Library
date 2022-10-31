require 'rails_helper'
RSpec.describe "Users", :type => :request do
    let(:apiapplication) { FactoryBot.create(:apiapplication) }
        let(:student)        { FactoryBot.build(:student) }
        let(:token)       { FactoryBot.create(:access_token, application: apiapplication, resource_owner_id: student.id) }
    context "when authorized " do
        it "shows all the users" do
            students = create(:student)
            get "/api/users", params: {}, headers: {'Authorization': 'Bearer ' + token.token}
            res = JSON.parse(response.body)
            expect(response).to have_http_status(200)
        end
        it "shows the history of the student" do
            borrow=create(:borrow)
            reservation=build(:reservation)
            get "/api/users", params: {}, headers: {'Authorization': 'Bearer ' + token.token}
            res = JSON.parse(response.body)
            expect(response).to have_http_status(200)

        end
    end
end