ActiveAdmin.register Education do
    permit_params :content, :candidate_id
  
    index do
      selectable_column
      id_column
      column :candidate
      column :content
      actions
    end
  
    filter :name
  
    form do |f|
      f.inputs do
        f.input :candidate
        f.input :content
      end
      f.actions
    end
  
  end
    