class FoodsController < ApplicationController
  
  before_action :authenticate_user!
  before_action :find_post, only: [:show, :download]

  def index
    @foods = Food.order('created_at DESC')
  end
 
  def new
    @food = Food.new
  end
 
  def show
  end

  def send_food_mail
    @food = Food.find(params[:id])
    @current_user_email = current_user.email
    @current_user_username = current_user.username    
    FoodShare.food_request(@food,@current_user_email,@current_user_username).deliver
    flash.now[:notice] = "Email has been sent to this Food Post User Succesfully"
    flash.now[:notice] = "You are now one step away from tasting this delicious food"
    redirect_to food_path(@food.id)
  end
 
  def create
    @food = Food.new(food_params)
    if @food.name != "" && @food.description != "" && @food.contact != ""  && @food.image.to_s != "/images/original/missing.png"          
      if @food.save
        redirect_to food_path(@food.id)
        else
        flash.now[:alert] = "Error in Food Posting, Posting cannot be saved,Image Size > 1 MB"
        render :new
      end  
    else 
      flash.now[:alert] = "Error in Food Posting, Some Fields Missing"
      puts "Incorrect Posting, some fields missing"
      render :new
    end
  end  
  private
 
  def food_params
    params.require(:food).permit(:name, :description, :image, :contact)

  end
 
  def find_post
    @food = Food.find(params[:id])
  end
end
