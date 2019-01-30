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
  end
  
  def index
  end

end
