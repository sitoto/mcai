require 'spec_helper'

describe "rules/show" do
  before(:each) do
    @rule = assign(:rule, stub_model(Rule,
      :name => "Name",
      :url_regular => "",
      :note => "Note"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(//)
    rendered.should match(/Note/)
  end
end
