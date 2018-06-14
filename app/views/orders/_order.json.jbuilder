json.extract! order, :id, :seller_id, :seller, :order_date, :amount, :pickup_address, :latitude_pickup, :longitude_pickup, :delivery_address, :latitude_delivery, :longitude_delivery, :notes, :status, :created_at, :updated_at
json.url order_url(order, format: :json)
