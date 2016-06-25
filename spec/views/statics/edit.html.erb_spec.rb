require 'rails_helper'

RSpec.describe "statics/edit", type: :view do
  before(:each) do
    @static = assign(:static, Static.create!(
      :home => "MyString",
      :faq => "MyString",
      :contact => "MyString"
    ))
  end

  it "renders the edit static form" do
    render

    assert_select "form[action=?][method=?]", static_path(@static), "post" do

      assert_select "input#static_home[name=?]", "static[home]"

      assert_select "input#static_faq[name=?]", "static[faq]"

      assert_select "input#static_contact[name=?]", "static[contact]"
    end
  end
end
