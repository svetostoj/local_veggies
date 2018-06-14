require 'rails_helper'

RSpec.describe "addresses/index", type: :view do
  before(:each) do
    assign(:addresses, [
      Address.create!(
        :user => nil,
        :longitude => 2.5,
        :latitude => 3.5,
        :street_address => "Street Address",
        :city => "City",
        :postcode => "Postcode",
        :state => "State",
        :country_code => "Country Code",
        :address_type => 4
      ),
      Address.create!(
        :user => nil,
        :longitude => 2.5,
        :latitude => 3.5,
        :street_address => "Street Address",
        :city => "City",
        :postcode => "Postcode",
        :state => "State",
        :country_code => "Country Code",
        :address_type => 4
      )
    ])
  end

  it "renders a list of addresses" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => 2.5.to_s, :count => 2
    assert_select "tr>td", :text => 3.5.to_s, :count => 2
    assert_select "tr>td", :text => "Street Address".to_s, :count => 2
    assert_select "tr>td", :text => "City".to_s, :count => 2
    assert_select "tr>td", :text => "Postcode".to_s, :count => 2
    assert_select "tr>td", :text => "State".to_s, :count => 2
    assert_select "tr>td", :text => "Country Code".to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
  end
end
