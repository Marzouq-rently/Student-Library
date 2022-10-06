class HomeController < ApplicationController
    before_action :authenticate_student!
    
    def homepage
        render"/home/_homepage"
    end
    def header
    end
    def header1
    end

end
