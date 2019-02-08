class PagesController < ApplicationController
 
  before_action :set_cache_headers
  before_action :authenticate_user!,except:[:home] 
  
  protect_from_forgery

  private

  def set_cache_headers
    response.headers["Cache-Control"] = "no-cache, no-store"
    response.headers["Pragma"] = "no-cache"
    response.headers["Expires"] = "Fri, 01 Jan 2020 00:00:00 GMT"
  end

  def home
    if user_signed_in?
      @current_user_email = current_user.email
      @current_user_name = current_user.name     
  end  
  end
  
  def index
  end

end
