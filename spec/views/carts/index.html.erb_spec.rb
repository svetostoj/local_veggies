require 'rails_helper'

RSpec.describe "carts/index", type: :view do
  before(:each) do
    assign(:carts, [
      Cart.create!(
        :order_id => 2,
        :buyer_id => 3,
        :product_id => 4,
        :product => "Product",
        :seller_id => 5,
        :unit_weight => "9.99",
        :unit => "Unit",
        :unit_price => "9.99",
        :qty => "9.99",
        :amount => "9.99",
        :total_weight => "9.99",
        :notes => "MyText"
      ),
      Cart.create!(
        :order_id => 2,
        :buyer_id => 3,
        :product_id => 4,
        :product => "Product",
        :seller_id => 5,
        :unit_weight => "9.99",
        :unit => "Unit",
        :unit_price => "9.99",
        :qty => "9.99",
        :amount => "9.99",
        :total_weight => "9.99",
        :notes => "MyText"
      )
    ])
  end

  it "renders a list of carts" do
    render
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
    assert_select "tr>td", :text => "Product".to_s, :count => 2
    assert_select "tr>td", :text => 5.to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "Unit".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
