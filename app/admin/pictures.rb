ActiveAdmin.register Picture do
  permit_params :url, :pictureable_type, :pictureable_id
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  #
  # or
  #
  # permit_params do
  #   permitted = [:url, :pictureable_type, :pictureable_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  form do |f|
    f.inputs do
      f.input :url
      f.input :pictureable_type
      f.input :pictureable_id
    end
    f.actions
  end
  
end
