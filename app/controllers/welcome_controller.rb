class WelcomeController < ApplicationController

  def index
    @candidates = Candidate.all
    @video = VideoInfo.new("https://www.youtube.com/watch?v=jhoMdWtztk8")  
  end
end