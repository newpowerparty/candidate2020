ActiveAdmin.register Donation do
    permit_params :donation_category_id, :name, :citizend, :mobile_phone, :total_amount,
                  :address, :description, :receipt_type, :donate_type, :confirmed, :confirmed_at,
                  :anonymous
  
    filter :confirmed
    filter :donation_category

    index do
      selectable_column
      id_column
      column :donation_category
      column :name
      column :donation_rewards do |donation|
        donation.donation_rewards
      end
      column :donation_items do |donation|
        donation.donation_items.pluck(:quantity)
      end
      column :total_amount
      column :address
      column :payment_type
      column :receipt_type
      column :donate_type
      column :confirmed
      actions
    end
  
    form do |f|
      f.inputs do
        f.input :donation_category_id
        f.input :name
        f.input :citizend
        f.input :mobile_phone
        f.input :total_amount
        f.input :description
        f.input :receipt_type
        f.input :donate_type
        f.input :confirmed
        f.input :confirmed_at
        f.input :anonymous
      end
      f.actions
    end
  
    controller do
      def scoped_collection
        super.includes :donation_category
      end
    end
  end
  