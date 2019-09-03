class OffersController < ApplicationController
  before_action :set_offer, only: [:show, :edit, :update, :destroy]
  def new
    @offer = Offer.new
  end

  def create
    @offer = Offer.new(offer_params)
    if @offer.save!
      redirect_to root_path
    end
  end

  def edit
  end

  def update
    if @offer.update
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @offer.destroy

    redirect_to root_path
  end

  private

  def set_offer
    @offer = Offer.find(params[:id])
  end

  def offer_params
    params.require(:offer).permit(:price, :bar_id, :product_id)
  end
end
