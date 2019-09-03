class OffersController < ApplicationController
  before_action :set_offer, only: [:show, :edit, :update, :destroy]
  def new
    @offer = Offer.new
  end

  def create
    @offer = Offer.new(offer_params)
    @bar = Bar.find(params[:bar_id])
    @bar = @offer.bar
  end

  def edit
  end

  def update
    if @offer.update
      redirect_to offer_path(@offer)
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
    params.require(:offer).permit(:price)
  end
end
