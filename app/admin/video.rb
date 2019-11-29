ActiveAdmin.register Video do
  permit_params :url, :position, :candidate

  index do
    selectable_column
    id_column
    column :candidate
    column :url
    column :position
    actions
  end

  filter :name

  form do |f|
    f.inputs do
      f.input :candidate
      f.input :url
      f.input :position
    end
    f.actions
  end

end
  