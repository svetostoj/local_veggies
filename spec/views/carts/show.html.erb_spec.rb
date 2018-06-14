require 'rails_helper'

RSpec.describe "carts/show", type: :view do
  before(:each) do
    @cart = assign(:cart, Cart.create!(
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
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/4/)
    expect(rendered).to match(/Product/)
    expect(rendered).to match(/5/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/Unit/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/MyText/)
  end
end
