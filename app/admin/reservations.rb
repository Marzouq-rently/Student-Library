ActiveAdmin.register Reservation do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :student_id, :book_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:student_id, :book_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  action_item :"status", only: :show do
    link_to "Status", reservation_path(reservation), method: :put
  end
end
