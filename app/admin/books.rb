ActiveAdmin.register Book do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :bookname, :author, :description, :copy, :availablecopy
  form do |f|
    f.inputs do
      f.input :bookname
      f.input :author
      f.input :description
      f.input :copy 
      f.input :availablecopy
    end
    f.actions
  end
  #
  # or
  #
  # permit_params do
  #   permitted = [:bookname, :author, :bookid, :description]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
