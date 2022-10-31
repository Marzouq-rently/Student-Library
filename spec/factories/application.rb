FactoryBot.define do
    factory :apiapplication, class: 'Doorkeeper::Application' do
        name {"Test Application"}
        redirect_uri {""}
        scopes {""}
    end
end