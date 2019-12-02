ActiveAdmin.register Title do
  permit_params :candidate_id, :content

  index do
    selectable_column
    id_column
    column :candidate
    column :content
    actions
  end

  form do |f|
    f.inputs do
      f.input :candidate
      f.input :content
    end
    f.actions
  end

end
