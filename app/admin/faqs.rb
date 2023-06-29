ActiveAdmin.register Faq do
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