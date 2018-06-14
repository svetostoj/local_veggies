require 'rails_helper'

RSpec.describe "profiles/edit", type: :view do
  before(:each) do
    @profile = assign(:profile, Profile.create!(
      :user => nil,
      :fullname_company => "MyString",
      :image_data => "MyText",
      :short_bio => "MyText",
      :mobile => "MyString",
      :account_number => "MyString"
    ))
  end

  it "renders the edit profile form" do
    render

    assert_select "form[action=?][method=?]", profile_path(@profile), "post" do

      assert_select "input[name=?]", "profile[user_id]"

      assert_select "input[name=?]", "profile[fullname_company]"

      assert_select "textarea[name=?]", "profile[image_data]"

      assert_select "textarea[name=?]", "profile[short_bio]"

      assert_select "input[name=?]", "profile[mobile]"

      assert_select "input[name=?]", "profile[account_number]"
    end
  end
end
