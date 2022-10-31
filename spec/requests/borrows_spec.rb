require 'rails_helper'
RSpec.describe "Borrows", :type => :request do
    context "when authorized" do
        let(:apiapplication) { FactoryBot.create(:apiapplication) }
        let(:student)        { FactoryBot.build(:student) }
        let(:token)       { FactoryBot.create(:access_token, application: apiapplication, resource_owner_id: student.id) }
        it "shows the borrows" do
            borrow = create(:borrow)
            get "/api/borrows", params: {}, headers: {'Authorization': 'Bearer ' + token.token}
            res = JSON.parse(response.body)
            expect(response).to have_http_status(200)
        end
    end
end
