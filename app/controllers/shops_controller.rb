class ShopsController < ApplicationController

  def index
    @shops = Shop.all
  end

  def show
    require "pry"; binding.pry
    @show = Show.find(params[:id])
  end

end
