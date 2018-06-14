require 'rails_helper'

RSpec.describe "order_items/index", type: :view do
  before(:each) do
    assign(:order_items, [
      OrderItem.create!(
        :order => nil,
        :buyer_id => 2,
        :product_id => 3,
        :product => "Product",
        :seller_id => 4,
        :unit_weight => "9.99",
        :unit => "Unit",
        :unit_price => "9.99",
        :qty => "9.99",
        :amount => "9.99",
        :total_weight => "9.99",
        :notes => "MyText"
      ),
      OrderItem.create!(
        :order => nil,
        :buyer_id => 2,
        :product_id => 3,
        :product => "Product",
        :seller_id => 4,
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

  it "renders a list of order_items" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => "Product".to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "Unit".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
