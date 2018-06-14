require 'rails_helper'

RSpec.describe "profiles/show", type: :view do
  before(:each) do
    @profile = assign(:profile, Profile.create!(
      :user => nil,
      :fullname_company => "Fullname Company",
      :image_data => "MyText",
      :short_bio => "MyText",
      :mobile => "Mobile",
      :account_number => "Account Number"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Fullname Company/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Mobile/)
    expect(rendered).to match(/Account Number/)
  end
end
