require 'rails_helper'

RSpec.describe "products/show", type: :view do
  before(:each) do
    @product = assign(:product, Product.create!(
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
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Product Type/)
    expect(rendered).to match(/Description/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/Unit/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/2/)
  end
end
