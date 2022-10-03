class PicturesController < ApplicationController
    before_action :authenticate_student_or_admin!
    
    def addprofile
    end

    def photo
        @e=params[:url]
        sid=current_student.id
        @studpro=Student.find(sid)
        @studpro.pictures.create(url:"#{@e}")
    end
    def showstudent
        sid=current_student.id
        @simg=Picture.find_by(pictureable_type:"Student", pictureable_id:sid)
    end
    def addbookphoto
        $bid=params[:id]
    end

    def bookphoto
        @im=params[:url]
        @bookpho=Book.find($bid)
        @bookpho.pictures.create(url:"#{@im}")
    end
    def show
        @img=Picture.find_by(pictureable_type:"Book", pictureable_id:$bid)
    end
end
