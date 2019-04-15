class Api::V1::CardsController < ApplicationController
  before_action :find_card, only: [:show, :update, :destroy]

  def index
    @cards = Card.all
    render json: @cards
  end

  def show
    render json: @card, status: 200
  end

  def create
    @card = Card.create(card_params)
    render json: @card, status: 201
  end

  def update
    @card.update(card_params)
    if @card.save
      render json: @card, status: :accepted
    else
      render json: { errors: @card.errors.full_messages }, status: :unprocessible_entity
    end
  end

  def destroy
    cardId = @card.id
    @card.destroy
    render json: {message: "Card deleted", cardId:cardID}
  end

  private

  def card_params
    params.require(:card).permit(:value, :suit, :deck_id)
  end

  def find_card
    @card = Card.find(params[:id])
  end
end
