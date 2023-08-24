class ReviewsController < ApplicationController
  before_action :set_restaurant, only: %i[new create] # evita repeticao de codigo
  def new
    # @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
    # @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new(review_params)
    @review.restaurant = @restaurant  # ta linkando um review a um restaurant pela id do restaurante (chave estrangeira) # Set foreign key restaurant_id
    if @review.save
      redirect_to restaurant_path(@restaurant) # volta pra pagina do restaurante que vc criou a review
    else
      render :new, status: :unprocessable_entity # faz isso pra dar o alerta do erro no formulario
    end
  end

  def destroy
    @review = Review.find(params[:id]) # ve depois pq aqui é assim e no restaurant faz params[:restaurant_id]
    @review.destroy
    redirect_to restaurant_path(@review.restaurant), status: :see_other
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
