ActiveAdmin.register Page do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :contact_image, :about_image
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

form do |f|
  f.inputs "Project Details" do
    f.input :contact_image, :as => :file#, :hint => f.template.image_tag(f.object.thumbnail.url(:thumb))
    f.input :about_image, :as => :file
    # Will preview the image when the object is edited
  end
  f.actions
end


end
