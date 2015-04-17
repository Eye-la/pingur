class PinsController < ApplicationController

  def index
    @pins = Pin.all
  end

  def new
    @pin = Pin.new
  end

  def create
    @pin = Pin.new(pin_params)

  end

  def show
    @pin = Pin.find(params[:id])
  end

  def edit
    @pin = Pin.find(params[:id])
    if @pin.save
      redirect_to pins_url
    else
      render :new
    end
  end

  def update
    @pin = Pin.find(params[:id])
    if @pin.update_attributes(pin_params)
      redirect_to "/pins/#{pin.id}"
    else
      render :edit
    end
  end

  def destroy
    @pin = Pin.find(params[:id])
    @pin.destroy
    redirect_to pins_url
  end

  private

  def pin_params
    params.require(:pin).permit(:url, :title, :author, :rating, :note)
  end

end
