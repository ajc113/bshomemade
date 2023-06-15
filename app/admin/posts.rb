ActiveAdmin.register Post do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :title, :description, :slug, :meta_title, :meta_description, :meta_keywords


#
show do |t|
	attributes_table do
		row :title
		row :description do |resource|
      raw(resource.content_to_plain_text)
    end
		row :created_at
		row :meta_title
		row :meta_description
		row :meta_keywords
	end
end

form :html => { :enctype => "multipart/form-data" } do |f|
	f.inputs do
		f.input :title
		f.input :created_at
		f.input :meta_title
		f.input :meta_description
		f.input :meta_keywords
		f.label :description, class: "post-description-label"
		f.rich_text_area :description, class: "post-rich-text-area"
	end
	f.actions
	end
end
