class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  def cart_items_count
    
    @cart_items_count = Cart.where(buyer_id: current_user.id).count.to_s
    
  end
end
