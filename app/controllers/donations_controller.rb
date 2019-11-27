class DonationsController < ApplicationController
  before_action :find_donation, only: [:show, :edit, :update]

  def create
    @donation = Donation.new(donation_params)

    if @donation.save
      if @donation.donation_category_id == 1  #小物
        @donation_itmes = @donation.donation_items.new(donation_id: @donation.id, donation_reward_id: params[:donation][:donation_items][:donation_reward_id], quantity: params[:donation][:donation_items][:quantity])
        @donation_itmes.save!
        @donation.set_total_amount
      end
      cookies.encrypted[:donation_id] = { value: @donation.id, expires: 15.minutes.from_now }
      redirect_to donation_path(@donation)
    else
      render "shared/_donation"
    end
    
  end

  def show
  end

  def edit
  end

  def update
    if @donation.update(donation_params)
      redirect_to donation_path(@donation)
    else
      render :edit
    end
    
  end

private
  def donation_params
    params.require(:donation).permit(
      :donation_category_id,
      :name,
      :mobile_phone,
      :total_amount,
      :road,
      :county,
      :district,
      :zipcode
    )
  end

  def address_params
    params.permit(:county, :district, :zipcode)
  end

  def find_donation
    @donation = Donation.find_by(id: cookies.encrypted[:donation_id])
    unless @donation
      flash[:error] = "很抱歉，該頁面已失效，請重新填寫。"
      redirect_to root_path
      return
    end
  end
end
