ActiveAdmin.register Video do
  permit_params :url, :position

  index do
    selectable_column
    id_column
    column :url
    column :position
    actions
  end

  filter :name

  form do |f|
    f.inputs do
      f.input :url
      f.input :position
    end
    f.actions
  end

end
  