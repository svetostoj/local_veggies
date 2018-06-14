require 'rails_helper'

RSpec.describe "addresses/edit", type: :view do
  before(:each) do
    @address = assign(:address, Address.create!(
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

  it "renders the edit address form" do
    render

    assert_select "form[action=?][method=?]", address_path(@address), "post" do

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
