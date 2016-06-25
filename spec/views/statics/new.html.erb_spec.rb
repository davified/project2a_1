require 'rails_helper'

RSpec.describe "statics/new", type: :view do
  before(:each) do
    assign(:static, Static.new(
      :home => "MyString",
      :faq => "MyString",
      :contact => "MyString"
    ))
  end

  it "renders new static form" do
    render

    assert_select "form[action=?][method=?]", statics_path, "post" do

      assert_select "input#static_home[name=?]", "static[home]"

      assert_select "input#static_faq[name=?]", "static[faq]"

      assert_select "input#static_contact[name=?]", "static[contact]"
    end
  end
end
