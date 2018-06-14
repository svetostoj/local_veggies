require 'rails_helper'

RSpec.describe "orders/show", type: :view do
  before(:each) do
    @order = assign(:order, Order.create!(
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
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Seller/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/Pickup Address/)
    expect(rendered).to match(/3.5/)
    expect(rendered).to match(/4.5/)
    expect(rendered).to match(/Delivery Address/)
    expect(rendered).to match(/5.5/)
    expect(rendered).to match(/6.5/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/7/)
  end
end
