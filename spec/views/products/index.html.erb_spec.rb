require 'rails_helper'

RSpec.describe "products/index", type: :view do
  before(:each) do
    assign(:products, [
      Product.create!(
        :user => nil,
        :product_type => "Product Type",
        :description => "Description",
        :unit_weight => "9.99",
        :unit => "Unit",
        :unit_price => "9.99",
        :qty_stock => "9.99",
        :qty_available => "9.99",
        :image_data => "MyText",
        :product_type_id => 2
      ),
      Product.create!(
        :user => nil,
        :product_type => "Product Type",
        :description => "Description",
        :unit_weight => "9.99",
        :unit => "Unit",
        :unit_price => "9.99",
        :qty_stock => "9.99",
        :qty_available => "9.99",
        :image_data => "MyText",
        :product_type_id => 2
      )
    ])
  end

  it "renders a list of products" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Product Type".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "Unit".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
