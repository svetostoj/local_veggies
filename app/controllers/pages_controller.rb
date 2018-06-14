class PagesController < ApplicationController
  def home
    @addresses=Address.all
    
    @long=Address.first.longitude
    @lati=Address.first.latitude
    @locations = []
    @addresses.each do |address|
      url = "#{products_path}?user_id=#{address.user_id}#home"
      address_address = address.street_address
      @locations << [address.latitude, address.longitude, url]
    end
  end
end
