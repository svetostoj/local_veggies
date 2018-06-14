require 'rails_helper'

RSpec.describe "profiles/index", type: :view do
  before(:each) do
    assign(:profiles, [
      Profile.create!(
        :user => nil,
        :fullname_company => "Fullname Company",
        :image_data => "MyText",
        :short_bio => "MyText",
        :mobile => "Mobile",
        :account_number => "Account Number"
      ),
      Profile.create!(
        :user => nil,
        :fullname_company => "Fullname Company",
        :image_data => "MyText",
        :short_bio => "MyText",
        :mobile => "Mobile",
        :account_number => "Account Number"
      )
    ])
  end

  it "renders a list of profiles" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Fullname Company".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Mobile".to_s, :count => 2
    assert_select "tr>td", :text => "Account Number".to_s, :count => 2
  end
end
