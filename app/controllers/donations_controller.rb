class DonationsController < ApplicationController
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
      redirect_to root_path, notice: "新增失敗"
    end
    
  end

  def show
    @donation = Donation.find_by(id: params[:id] )
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
end
