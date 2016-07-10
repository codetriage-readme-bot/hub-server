class CardsController < ApplicationController
  def index
    @cards = Card.all
    render json: @cards
  end

  def show
    @card = Card.find(params[:id])
    render json: @card
  end

  def create
    @card = Card.new(card_params)

    if @card.save
      # @card.users << User.find(params[:data][:relationships][:users][:data]) if params[:data][:relationships][:users][:data]
      @card.users << User.find(user_params)

      render json: @card
    else
      render json: @card, :status => 422
    end
  end

  def update
    @card = Card.find(params[:id])
    if @card.update_attributes(card_params)
      render json: @card
    else
      render json: @card, status: 422
    end
  end

  private

  def user_params
     params.require(:data).require(:relationships).require(:users).permit(data: [:id]).require(:data).map(&:values)
  end

  def card_params
     params.require(:data).require(:attributes).permit(:title, :description)
  end

end
