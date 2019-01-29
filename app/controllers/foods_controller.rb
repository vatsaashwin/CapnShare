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
 
  def create
    @food = Food.new(food_params)
    if @food.save
      redirect_to food_path(@food.id)
    else
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
