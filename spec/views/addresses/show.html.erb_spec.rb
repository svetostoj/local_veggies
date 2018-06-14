require 'rails_helper'

RSpec.describe "addresses/show", type: :view do
  before(:each) do
    @address = assign(:address, Address.create!(
      :user => nil,
      :longitude => 2.5,
      :latitude => 3.5,
      :street_address => "Street Address",
      :city => "City",
      :postcode => "Postcode",
      :state => "State",
      :country_code => "Country Code",
      :address_type => 4
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/2.5/)
    expect(rendered).to match(/3.5/)
    expect(rendered).to match(/Street Address/)
    expect(rendered).to match(/City/)
    expect(rendered).to match(/Postcode/)
    expect(rendered).to match(/State/)
    expect(rendered).to match(/Country Code/)
    expect(rendered).to match(/4/)
  end
end
