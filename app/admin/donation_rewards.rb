ActiveAdmin.register DonationReward do
    permit_params :donation_category_id, :heading, :image, :amount, :active, :position
  
    index do
      selectable_column
      id_column
      column :donation_category
      column :heading
      column "Image" do |product|
        image_tag product.image.thumb.url
      end
      column :amount
      column :position
      column :active
      actions
    end


    show do
      attributes_table do
        row :donation_category_id
        row :heading
        row :image do |ad|
          image_tag ad.image.thumb.url
        end
        row :amount
        row :position
        row :active
      end
    end
    
    filter :heading
  
    form do |f|
      f.inputs do
        f.input :donation_category
        f.input :heading
        f.input :image, :as => :file, :hint => f.object.image.present? ? image_tag(f.object.image.thumb.url) : content_tag(:span, "no cover page yet")
        f.input :amount
        f.input :position
        f.input :active
      end
      f.actions
    end
  

  end
  