json.extract! product, :id, :user_id, :product_type, :description, :unit_weight, :unit, :unit_price, :qty_stock, :qty_available, :image_data, :product_type_id, :created_at, :updated_at
json.url product_url(product, format: :json)
