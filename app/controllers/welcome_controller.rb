class WelcomeController < ApplicationController

  def index
    @system ||= System.first
		@title ||= @system.name
		@title ||= "2020選舉專區"
		@description ||= @system.description
		@description ||= "兩年前，時代力量走進立法院，讓理想在國會實踐；兩年後的現在，讓我們從地方開始，加速台灣的改變。邀請您一同加入保證金募資專案，任何一筆捐款，無論金額大小，都能幫助時代力量在地方議會繼續茁壯。"

		@image ||= ActionController::Base.helpers.image_path("fb-cover.png")

		@site ||= "時代力量 New Power Party"
		@meta_keyword ||= "時代力量,選舉,網站,競選,官網, 2020"
    
    
    @candidates = Candidate.includes(:images, :videos).all
    @videos ||= Video.where(candidate_id: nil)
		@first_video ||= @videos.first
    @donation_categories = DonationCategory.includes(:donation_rewards).all
    @donation = Donation.new

  end
end