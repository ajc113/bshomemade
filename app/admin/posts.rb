ActiveAdmin.register Post do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :title, :description, :slug, :image, :meta_title, :meta_description, :meta_keywords

#
show do |t|
	attributes_table do
		row :title
		row :description
		row :created_at
		row :slug
		row :image
		row :meta_title
		row :meta_description
		row :meta_keywords
	end
end

form :html => { :enctype => "multipart/form-data" } do |f|
	f.inputs do
		f.input :title
		f.input :description
		f.input :created_at
		f.input :slug
		f.file_field :image
		f.input :meta_title
		f.input :meta_description
		f.input :meta_keywords
	end
	f.actions
	end
end
