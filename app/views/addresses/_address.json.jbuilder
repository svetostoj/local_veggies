json.extract! address, :id, :user_id, :longitude, :latitude, :street_address, :city, :postcode, :state, :country_code, :address_type, :created_at, :updated_at
json.url address_url(address, format: :json)
