class DonatesController < ApplicationController

  before_action :authenticate_user!
  
  def index
    flash.now[:notice] = "We are currently serving shelters near Corvallis campus only"
    @donates = Donate.all
  end

end
