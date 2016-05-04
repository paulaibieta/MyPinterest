class PinsController < ApplicationController

  def index
    @pins = Pin.all
  end 

  def new
    @pin = Pin.new
  end 

  def create
    @pin = Pin.create pin_params
    render :show
  end 

  def show
    @pin = Pin.find params[:id]
  end 

  private

  def pin_params
    params.require(:pin).permit(:title, :description)
  end 

end 