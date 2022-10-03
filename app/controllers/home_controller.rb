class HomeController < ApplicationController
    before_action :authenticate_student_or_admin!
    
    def homepage
        render "/home/homepage"
    end
    def header
    end
    def header1
    end

end
