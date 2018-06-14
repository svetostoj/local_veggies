require 'rails_helper'

RSpec.describe "products/new", type: :view do
  before(:each) do
    assign(:product, Product.new(
      :user => nil,
      :product_type => "MyString",
      :description => "MyString",
      :unit_weight => "9.99",
      :unit => "MyString",
      :unit_price => "9.99",
      :qty_stock => "9.99",
      :qty_available => "9.99",
      :image_data => "MyText",
      :product_type_id => 1
    ))
  end

  it "renders new product form" do
    render

    assert_select "form[action=?][method=?]", products_path, "post" do

      assert_select "input[name=?]", "product[user_id]"

      assert_select "input[name=?]", "product[product_type]"

      assert_select "input[name=?]", "product[description]"

      assert_select "input[name=?]", "product[unit_weight]"

      assert_select "input[name=?]", "product[unit]"

      assert_select "input[name=?]", "product[unit_price]"

      assert_select "input[name=?]", "product[qty_stock]"

      assert_select "input[name=?]", "product[qty_available]"

      assert_select "textarea[name=?]", "product[image_data]"

      assert_select "input[name=?]", "product[product_type_id]"
    end
  end
end
