require 'rails_helper'

RSpec.describe "order_items/new", type: :view do
  before(:each) do
    assign(:order_item, OrderItem.new(
      :order => nil,
      :buyer_id => 1,
      :product_id => 1,
      :product => "MyString",
      :seller_id => 1,
      :unit_weight => "9.99",
      :unit => "MyString",
      :unit_price => "9.99",
      :qty => "9.99",
      :amount => "9.99",
      :total_weight => "9.99",
      :notes => "MyText"
    ))
  end

  it "renders new order_item form" do
    render

    assert_select "form[action=?][method=?]", order_items_path, "post" do

      assert_select "input[name=?]", "order_item[order_id]"

      assert_select "input[name=?]", "order_item[buyer_id]"

      assert_select "input[name=?]", "order_item[product_id]"

      assert_select "input[name=?]", "order_item[product]"

      assert_select "input[name=?]", "order_item[seller_id]"

      assert_select "input[name=?]", "order_item[unit_weight]"

      assert_select "input[name=?]", "order_item[unit]"

      assert_select "input[name=?]", "order_item[unit_price]"

      assert_select "input[name=?]", "order_item[qty]"

      assert_select "input[name=?]", "order_item[amount]"

      assert_select "input[name=?]", "order_item[total_weight]"

      assert_select "textarea[name=?]", "order_item[notes]"
    end
  end
end
