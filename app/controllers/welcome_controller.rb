class WelcomeController < ApplicationController

  def index
    @candidates = Candidate.all
    @videos = Video.all  
    @first_video = @videos.first
    @donation_categories = DonationCategory.includes(:donation_rewards).all
    @donation = Donation.new
    # @doantion.donation_items.build
  end
end