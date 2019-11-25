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
  validates :name, presence: true, unless: :anonymous?
  validates :citizen_id, presence: true, unless: :anonymous?
  validates :mobile_phone, presence: true, unless: :anonymous?
  validates :email, presence: true
  validates :email, email: true
  validates :receipt_title, presence: true, if: Proc.new {|a| !a.anonymous? && !a.no_receipt? }
  #validates :address, presence: true
  
  
  before_save :upcase_field, if: Proc.new { |a| a.citizen_id.present? }
  
  def set_total_amount
    self.total_amount = donation_items.sum(:amount)
    self.save
  end

  def upcase_field
    self.citizen_id.to_s.upcase
  end
end
