class BarsController < ApplicationController
  before_action :set_bar, only: [:show, :edit, :update, :destroy]
  def new
    @bar = Bar.new
  end

  def create
    @bar = Bar.new(bar_params)
  end

  def edit
  end

  def update
    if @bar.update
      redirect_to bar_path(@bar)
    else
      render :edit
    end
  end

  def destroy
    @bar.destroy

    redirect_to root_path
  end

  private

  def set_bar
    @bar = Bar.find(params[:id])
  end

  def bar_params
    params.require(:bar).permit(:address, :description, :name)
  end
end
