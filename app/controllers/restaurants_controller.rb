class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    # salvar com mensagem
    if @restaurant.save
      redirect_to restaurant_path(@restaurant), notice: 'Restaurant was successfully created.'
    else
      render :new, status: :unprocessable_entity # so pra mostrar mensagem de erro
    end
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :phone_number, :category)
  end
end
