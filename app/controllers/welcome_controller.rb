class WelcomeController < ApplicationController

  def index
    @candidates = Candidate.all
    @video = VideoInfo.new("https://www.youtube.com/watch?v=jhoMdWtztk8")  
    @donation_categories = DonationCategory.includes(:donation_rewards).all
    @donation = Donation.new
    # @doantion.donation_items.build
  end
end