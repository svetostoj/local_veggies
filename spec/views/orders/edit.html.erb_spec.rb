require 'rails_helper'

RSpec.describe "orders/edit", type: :view do
  before(:each) do
    @order = assign(:order, Order.create!(
      :seller_id => 1,
      :seller => "MyString",
      :amount => "9.99",
      :pickup_address => "MyString",
      :latitude_pickup => 1.5,
      :longitude_pickup => 1.5,
      :delivery_address => "MyString",
      :latitude_delivery => 1.5,
      :longitude_delivery => 1.5,
      :notes => "MyText",
      :status => 1
    ))
  end

  it "renders the edit order form" do
    render

    assert_select "form[action=?][method=?]", order_path(@order), "post" do

      assert_select "input[name=?]", "order[seller_id]"

      assert_select "input[name=?]", "order[seller]"

      assert_select "input[name=?]", "order[amount]"

      assert_select "input[name=?]", "order[pickup_address]"

      assert_select "input[name=?]", "order[latitude_pickup]"

      assert_select "input[name=?]", "order[longitude_pickup]"

      assert_select "input[name=?]", "order[delivery_address]"

      assert_select "input[name=?]", "order[latitude_delivery]"

      assert_select "input[name=?]", "order[longitude_delivery]"

      assert_select "textarea[name=?]", "order[notes]"

      assert_select "input[name=?]", "order[status]"
    end
  end
end
