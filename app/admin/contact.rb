ActiveAdmin.register Contact do
    permit_params :candidate_id, :name, :typee, :text
  
    index do
      selectable_column
      id_column
      column :candidate
      column :typee
      column :name
      column :text
      actions
    end
  
    filter :name
  
    form do |f|
      f.inputs do
        f.input :candidate
        f.input :typee
        f.input :name
        f.input :text
      end
      f.actions
    end
  
  end
    