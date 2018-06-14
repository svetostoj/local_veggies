class Address < ApplicationRecord
  belongs_to :user

  validates(
    :street_address, 
    :city, 
    :postcode, 
    :state, 
    :country_code, 
    presence: true)

geocoded_by :full_address
after_validation :geocode
    
    

def full_address
  "#{street_address}, #{city}, #{state}, #{postcode}, #{country_code}"
end

end
