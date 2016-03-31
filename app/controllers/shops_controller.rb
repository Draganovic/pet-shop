class ShopsController < ApplicationController

  def index
    @shops = Shop.all
    # @puppies = Puppies.all
  end

  def show
    @shop = Shop.find(params[:id])
  end

end
