ActiveAdmin.register Contact do
    permit_params :candidate_id, :phone, :email, :official_site
  
    index do
      selectable_column
      id_column
      column :candidate
      column :phone
      column :email
      column :official_site
      actions
    end
  
    filter :name
  
    form do |f|
      f.inputs do
        f.input :candidate
        f.input :phone
        f.input :email
        f.input :official_site
      end
      f.actions
    end
  
  end
    