class FoodsController < ApplicationController
  
  before_action :authenticate_user!
  before_action :find_post, only: [:show, :download]

  def index
    @foods = Food.order('created_at DESC')
  end
 
  def new
    @food = Food.new
  end
    
  def edit    
    @food = Food.find(params[:id])
  end

  def update        
    @food = Food.find(params[:id])
    
    @food.update(food_params)
    flash.now[:alert] = "Food Post has been edited successfully"
    redirect_to food_path(@food.id)
  end 
 
  def destroy  
    @food = Food.find(params[:id])
    @food.destroy    
    redirect_to foods_path
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
        flash.now[:alert] = "Error in Food Posting, Posting cannot be saved,Image Size > 5 MB"
        render :new
      end  
    else 
      flash.now[:alert] = "Error in Food Posting, Some Fields Missing"
      puts "Incorrect Posting, some fields missing"
      render :new
    end
  end  
  #private
 
  def food_params
    expiry_date = params[:expiry_date]
    expiry_date.to_s.split('/').rotate(-1).reverse.join('/')
    params.require(:food).permit(:name, :description, :image, :contact,:expiry_date)
  end
 
  def find_post
    @food = Food.find(params[:id])
  end

end
