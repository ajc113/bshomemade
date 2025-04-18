ActiveAdmin.register Trailer do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :firstname, :lastname, :email, :phone, :date, :address1, :address2, :city, :state, :zip, :eventstart, :guest, :detail, :responded_to

  # Add responded_to to the index view
  index do
    selectable_column
    id_column
    column :firstname
    column :lastname
    column :email
    column :phone
    column :date
    column :city
    column :state
    column :responded_to do |trailer|
      if trailer.responded_to
        "<span class='status_tag' style='background-color: green; color: white;'>Responded</span>".html_safe
      else
        "<span class='status_tag' style='background-color: orange; color: white;'>Pending</span>".html_safe
      end
    end
    actions
  end

  # Add responded_to to the show view
  show do
    attributes_table do
      row :id
      row :firstname
      row :lastname
      row :email
      row :phone
      row :date
      row :address1
      row :address2
      row :city
      row :state
      row :zip
      row :eventstart
      row :guest
      row :detail
      row :responded_to do |trailer|
        if trailer.responded_to
          "<span class='status_tag' style='background-color: green; color: white;'>Responded</span>".html_safe
        else
          "<span class='status_tag' style='background-color: orange; color: white;'>Pending</span>".html_safe
        end
      end
      row :created_at
      row :updated_at
    end
  end

  # Add a toggle button to the show page
  action_item :toggle_responded_to, only: :show do
    if resource.responded_to
      link_to 'Mark as Pending', toggle_responded_to_admin_trailer_path(resource), method: :post
    else
      link_to 'Mark as Responded', toggle_responded_to_admin_trailer_path(resource), method: :post
    end
  end

  # Add a member action for toggling the responded_to status
  member_action :toggle_responded_to, method: :post do
    resource.update(responded_to: !resource.responded_to)
    redirect_to resource_path, notice: "Trailer inquiry marked as #{resource.responded_to ? 'responded' : 'pending'}"
  end
  
end
