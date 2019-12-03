class WelcomeController < ApplicationController

  def index
    @system ||= System.first
		@title ||= @system.name
		@title ||= "時代力量 2020 公平正義 改變台灣"
		@description ||= @system.description
		@description ||= "政黨票請投時代力量，用公平正義改變台灣！請認識我們推出的優秀候選人、瞭解我們在11大領域推出的政見，我們堅持用實質改革推動台灣進步！"

		@image ||= ActionController::Base.helpers.image_path("fb-cover.png")

		@site ||= "時代力量 New Power Party"
		@meta_keyword ||= "時代力量,選舉,網站,競選,官網, 2020"
    
    
    @candidates = Candidate.includes(:images, :videos).all
    @videos ||= Video.where(candidate_id: nil)
    @first_video ||= @videos.first
    @donation_commodity, @donation_free = DonationCategory.includes(:donation_rewards).first, DonationCategory.includes(:donation_rewards).last

    @donation = Donation.new

  end
end