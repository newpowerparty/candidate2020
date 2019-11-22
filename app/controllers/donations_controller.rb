class DonationsController < ApplicationController
  def create
    @donation = Donation.new(donation_params)

    if @donation.save!
      @donation_itmes = @donation.donation_items.new
      @donation_itmes.donation_id = @donation.id
      @donation_itmes.donation_reward_id = params[:donation][:donation_items][:donation_reward_id]
      @donation_itmes.quantity = params[:donation][:donation_items][:quantity]
      @donation_itmes.save!
      cookies.encrypted[:donation_id] = { value: @donation.id, expires: 15.minutes.from_now }
    end
    @donation.set_total_amount

    redirect_to donation_path(@donation)
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
      :address
    )
  end
end
