class PuppiesController<ApplicationController

  def index
    @shop = Shop.find_by(id: params[:shop_id])
    @puppies = Puppy.where(shop_id: params[:shop_id])
  end

end
