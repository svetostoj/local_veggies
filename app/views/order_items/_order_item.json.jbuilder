json.extract! order_item, :id, :order_id, :buyer_id, :product_id, :product, :seller_id, :unit_weight, :unit, :unit_price, :qty, :amount, :total_weight, :notes, :created_at, :updated_at
json.url order_item_url(order_item, format: :json)
