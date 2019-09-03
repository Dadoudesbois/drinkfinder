class BarsController < ApplicationController
  before_action :set_bar, only: [:show, :edit, :update, :destroy]
  def index
    @bars = Bar.geocoded

    @markers = @bars.map do |bar|
      {
        lat: bar.latitude,
        lng: bar.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { bar: bar }),
        image_url: helpers.asset_url('logo.png')
      }
    end
  end

  def show
    @markers = [{
        lat: @bar.latitude,
        lng: @bar.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { bar: @bar }),
        image_url: helpers.asset_url('logo.png')
      }]
  end

  def new
    @bar = Bar.new
  end

  def create
    @bar = Bar.new(bar_params)

    if @bar.save!
      redirect_to bar_path(@bar)
    end
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
    params.require(:bar).permit(:address, :description, :name, :photo)
  end
end
