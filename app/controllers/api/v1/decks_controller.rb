class Api::V1::DecksController < ApplicationController
  before_action :find_deck, only: [:show, :update, :destroy]

  def index
    @decks = Deck.all
    render json: @decks
  end

  def show
    render json: @deck, status: 200
  end

  def create
    @deck = Deck.create(deck_params)
    render json: @deck, status: 201
  end

  def update
    @deck.update(deck_params)
    if @deck.save
      render json: @deck, status: :accepted
    else
      render json: { errors: @deck.errors.full_messages }, status: :unprocessible_entity
    end
  end

  def destroy
    deckId = @deck.id
    @deck.destroy
    render json: {message: "Deck deleted", deckId:deckID}
  end

  private

  def deck_params
    params.require(:deck).permit(:shuffled, :cards_count)
  end

  def find_deck
    @deck = Deck.find(params[:id])
  end

end
