ActiveAdmin.register DonationItem do
    permit_params :donation_reward_id, :donation_id, :quantity, :amount
  
    index do
      selectable_column
      id_column
      column :donation_reward_id
      column :donation_id
      column :quantity
      column :amount
      actions
    end
  
    filter :amount
  
    form do |f|
      f.inputs do
        f.input :donation_reward_id
        f.input :donation_id
        f.input :quantity
        f.input :amount
      end
      f.actions
    end
  
  end
  