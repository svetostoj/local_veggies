require 'rails_helper'

RSpec.describe "orders/index", type: :view do
  before(:each) do
    assign(:orders, [
      Order.create!(
        :seller_id => 2,
        :seller => "Seller",
        :amount => "9.99",
        :pickup_address => "Pickup Address",
        :latitude_pickup => 3.5,
        :longitude_pickup => 4.5,
        :delivery_address => "Delivery Address",
        :latitude_delivery => 5.5,
        :longitude_delivery => 6.5,
        :notes => "MyText",
        :status => 7
      ),
      Order.create!(
        :seller_id => 2,
        :seller => "Seller",
        :amount => "9.99",
        :pickup_address => "Pickup Address",
        :latitude_pickup => 3.5,
        :longitude_pickup => 4.5,
        :delivery_address => "Delivery Address",
        :latitude_delivery => 5.5,
        :longitude_delivery => 6.5,
        :notes => "MyText",
        :status => 7
      )
    ])
  end

  it "renders a list of orders" do
    render
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Seller".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "Pickup Address".to_s, :count => 2
    assert_select "tr>td", :text => 3.5.to_s, :count => 2
    assert_select "tr>td", :text => 4.5.to_s, :count => 2
    assert_select "tr>td", :text => "Delivery Address".to_s, :count => 2
    assert_select "tr>td", :text => 5.5.to_s, :count => 2
    assert_select "tr>td", :text => 6.5.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 7.to_s, :count => 2
  end
end
