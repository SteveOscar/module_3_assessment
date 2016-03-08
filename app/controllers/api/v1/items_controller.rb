class Api::V1::ItemsController < ApplicationController
  respond_to :json

  def index
    respond_with Item.all
  end

  def show
    respond_with Item.find(params[:id])
  end

  def create
    binding.pry
    respond_with Item.create(item_params), location: nil
  end

  def destroy
    respond_with Item.find(params[:id]).delete, location: nil
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :image_url)
  end

end
