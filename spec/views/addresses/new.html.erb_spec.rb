require 'rails_helper'

RSpec.describe "addresses/new", type: :view do
  before(:each) do
    assign(:address, Address.new(
      :user => nil,
      :longitude => 1.5,
      :latitude => 1.5,
      :street_address => "MyString",
      :city => "MyString",
      :postcode => "MyString",
      :state => "MyString",
      :country_code => "MyString",
      :address_type => 1
    ))
  end

  it "renders new address form" do
    render

    assert_select "form[action=?][method=?]", addresses_path, "post" do

      assert_select "input[name=?]", "address[user_id]"

      assert_select "input[name=?]", "address[longitude]"

      assert_select "input[name=?]", "address[latitude]"

      assert_select "input[name=?]", "address[street_address]"

      assert_select "input[name=?]", "address[city]"

      assert_select "input[name=?]", "address[postcode]"

      assert_select "input[name=?]", "address[state]"

      assert_select "input[name=?]", "address[country_code]"

      assert_select "input[name=?]", "address[address_type]"
    end
  end
end
