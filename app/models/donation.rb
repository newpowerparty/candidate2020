class Donation < ApplicationRecord
  has_many :donation_items
  has_many :donation_rewards, through: :donation_items
  has_many :donation_categories, through: :donation_rewards
  
  belongs_to :donation_category
  enum donate_type: {
    person: 1,
    company: 2
  }
  enum receipt_type: {
    mailing: 0, #email收據
    paper: 1, #紙本收據
    no_receipt: 2 #不要收據
  }
  
  
  def set_total_amount
    self.total_amount = donation_items.sum(:amount)
    self.save
  end
end
