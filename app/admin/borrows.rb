ActiveAdmin.register Borrow do

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
  # show do
  #   attributes_table(*default_attribute_table_rows) do
  #     row "Return Status" do
  #       "-"
  #     end
  #   end
  # end
action_item :"return", only: :show do
  link_to "Return", return_borrow_path(borrow)
end
  
end
