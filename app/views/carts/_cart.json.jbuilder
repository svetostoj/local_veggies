json.extract! cart, :id, :order_id, :buyer_id, :product_id, :product, :seller_id, :unit_weight, :unit, :unit_price, :qty, :amount, :total_weight, :notes, :created_at, :updated_at
json.url cart_url(cart, format: :json)
