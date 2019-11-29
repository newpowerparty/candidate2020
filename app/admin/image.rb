ActiveAdmin.register Image do
  permit_params :file_name, :file_url, :position, :candidate

  index do
    selectable_column
    id_column
    column :candidate
    column :file_name
    column :file_url do |image|
      image_tag image.file_url.thumb.url
    end
    column :position
    actions
  end

  form do |f|
    f.inputs do
      f.input :candidate
      f.input :file_name
      f.input :file_url
      f.input :position
    end
    f.actions
  end

end
  