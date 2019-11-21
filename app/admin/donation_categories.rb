ActiveAdmin.register DonationCategory do
    permit_params :name, :content, :image
  
    index do
      selectable_column
      id_column
      column :name
      column :content
      column :image
      actions
    end
  
    filter :name
  
    form do |f|
      f.inputs do
        f.input :name
        f.input :content
        f.input :image
      end
      f.actions
    end
  
  end
  