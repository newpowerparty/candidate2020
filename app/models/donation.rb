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

  validates :total_amount, numericality: { only_integer: true, greater_than: 299, message: "捐款金額不得低於300" }, if: Proc.new{ |a| a.donation_category_id == 2 } 
  validates :name, presence: true, unless: :anonymous?
  validates :mobile_phone, presence: { message: "手機號碼不得為空" }, unless: :anonymous?
  validates :county, :district, :road, presence: true
  
  
  def set_total_amount
    self.total_amount = donation_items.sum(:amount) 
    self.save
  end

  def address
    "#{county}#{district}#{road}"
  end

  # def min_dollar
  #   if total_amount < 300
  #     errors.add(:total_amount, "小於最低捐款金額")
  #     throw :abort
  #   end
  # end

end
