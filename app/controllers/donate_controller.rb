class DonateController < ApplicationController
  
  before_action :authenticate_user!
  
  def index
    flash.now[:notice] = "We are currently providing shelter information near Corvallis campus only"
  end

end
