ActiveAdmin.register Donation do
    permit_params :donation_category_id, :name, :citizend, :mobile_phone, :total_amount,
                  :address, :description, :receipt_type, :donate_type, :confirmed, :confirmed_at,
                  :anonymous
  
    index do
      selectable_column
      id_column
      column :donation_category
      column :name
      column :total_amount
      column :address
      column :receipt_type
      column :donate_type
      column :confirmed
      actions
    end
  
    filter :confirmed
  
    form do |f|
      f.inputs do
        f.input :donation_category_id
        f.input :name
        f.input :citizend
        f.input :mobile_phone
        f.input :total_amount
        f.input :address
        f.input :description
        f.input :receipt_type
        f.input :donate_type
        f.input :confirmed
        f.input :confirmed_at
        f.input :anonymous
      end
      f.actions
    end
  
  end
  