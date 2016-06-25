require 'rails_helper'

RSpec.describe "statics/index", type: :view do
  before(:each) do
    assign(:statics, [
      Static.create!(
        :home => "Home",
        :faq => "Faq",
        :contact => "Contact"
      ),
      Static.create!(
        :home => "Home",
        :faq => "Faq",
        :contact => "Contact"
      )
    ])
  end

  it "renders a list of statics" do
    render
    assert_select "tr>td", :text => "Home".to_s, :count => 2
    assert_select "tr>td", :text => "Faq".to_s, :count => 2
    assert_select "tr>td", :text => "Contact".to_s, :count => 2
  end
end
