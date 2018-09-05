ActiveAdmin.register Flavor do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :name, :description, :created_at, :availability, :flavorofweek, :image



show do |t|
	attributes_table do
		row :name
		row :description
		row :created_at
		row :availability
		row :flavorofweek
		row :image
	end
end

form :html => { :enctype => "multipart/form-data" } do |f|
	f.inputs do
		f.input :name
		f.input :description
		f.input :created_at
		f.input :availability
		f.input :flavorofweek
		f.file_field :image
	end
	f.actions
	end
end
