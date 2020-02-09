ActiveAdmin.register Flavor do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :name, :description, :created_at, :instock, :flavorofweek, :image, :availability



show do |t|
	attributes_table do
		row :name
		row :description
		row :instock
		row :created_at
		row :flavorofweek
		row :image
		row :availability
	end
end

form :html => { :enctype => "multipart/form-data" } do |f|
	f.inputs do
		f.input :name
		f.input :description
		f.input :instock
		f.input :created_at
		f.input :flavorofweek
		f.file_field :image
		f.input :availability
	end
	f.actions
	end
end
