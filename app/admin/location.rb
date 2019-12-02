ActiveAdmin.register Location do
    permit_params :content
  
    index do
      selectable_column
      id_column
      column :content
      actions
    end
  
    filter :name
  
    form do |f|
      f.inputs do
        f.input :content
      end
      f.actions
    end
  
  end
    