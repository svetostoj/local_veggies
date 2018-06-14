require 'rails_helper'

RSpec.describe "carts/edit", type: :view do
  before(:each) do
    @cart = assign(:cart, Cart.create!(
      :order_id => 1,
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

  it "renders the edit cart form" do
    render

    assert_select "form[action=?][method=?]", cart_path(@cart), "post" do

      assert_select "input[name=?]", "cart[order_id]"

      assert_select "input[name=?]", "cart[buyer_id]"

      assert_select "input[name=?]", "cart[product_id]"

      assert_select "input[name=?]", "cart[product]"

      assert_select "input[name=?]", "cart[seller_id]"

      assert_select "input[name=?]", "cart[unit_weight]"

      assert_select "input[name=?]", "cart[unit]"

      assert_select "input[name=?]", "cart[unit_price]"

      assert_select "input[name=?]", "cart[qty]"

      assert_select "input[name=?]", "cart[amount]"

      assert_select "input[name=?]", "cart[total_weight]"

      assert_select "textarea[name=?]", "cart[notes]"
    end
  end
end
