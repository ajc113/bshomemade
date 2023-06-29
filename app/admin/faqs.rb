ActiveAdmin.register Faq do
  config.sort_order = 'position_asc'
  config.paginate   = false

  reorderable

  actions :index, :show, :new, :create, :edit, :update, :destroy

  # Reorderable Index Table
  index as: :reorderable_table do
    column :question
    column :answer do |resource|
      raw(resource.to_plain_text(resource.answer))
    end
    column :created_at
  end

  permit_params :question, :answer

  show do |t|
    attributes_table do
      row :question
      row :answer do |resource|
        raw(resource.to_plain_text(resource.answer))
      end
    end
  end
  
  form do |f|
    f.inputs do
      f.input :question
      f.label :answer, class: "post-description-label"
      f.rich_text_area :answer, class: "post-rich-text-area", style: "height: 350px"
    end
    f.actions
    end
  end