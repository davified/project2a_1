require 'rails_helper'

RSpec.describe "statics/show", type: :view do
  before(:each) do
    @static = assign(:static, Static.create!(
      :home => "Home",
      :faq => "Faq",
      :contact => "Contact"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Home/)
    expect(rendered).to match(/Faq/)
    expect(rendered).to match(/Contact/)
  end
end
