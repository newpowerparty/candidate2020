ActiveAdmin.register Candidate do
  permit_params :name, :headshot, :typee, :number, :content

  index do
    selectable_column
    id_column
    column :number
    column :name
    column :avatar do |product|
      image_tag product.headshot.thumb.url
    end
    column :typee
    column :content
    column :images
    column :locations
    actions
  end
  
  form do |f|
    f.inputs do
      f.input :name
      f.input :headshot do |product|
        image_tag product.headshot.thumb.url
      end
      f.input :typee
      f.input :number
      f.input :content
    end
    f.actions
  end

  controller do
    def scoped_collection
      super.includes :images, :videos, :locations
    end
  end
end
  

# ActiveAdmin.register DonationReward do
#   permit_params :donation_category_id, :name, :image, :amount, :active

#   index do
#     selectable_column
#     id_column
#     column :donation_category
#     column :name
#     column "Image" do |product|
#       image_tag product.image.thumb.url
#     end
#     column :amount
#     column :active
#     actions
#   end


#   show do
#     attributes_table do
#       row :donation_category_id
#       row :name
#       row :image do |ad|
#         image_tag ad.image.thumb.url
#       end
#       row :amount
#       row :active
#     end
#   end
  
#   filter :name

#   form do |f|
#     f.inputs do
#       f.input :donation_category
#       f.input :name
#       f.input :image, :as => :file, :hint => f.object.image.present? ? image_tag(f.object.image.thumb.url) : content_tag(:span, "no cover page yet")
#       f.input :amount
#       f.input :active
#     end
#     f.actions
#   end


# end
