require 'spec_helper'

describe "rules/index" do
  before(:each) do
    assign(:rules, [
      stub_model(Rule,
        :name => "Name",
        :url_regular => "",
        :note => "Note"
      ),
      stub_model(Rule,
        :name => "Name",
        :url_regular => "",
        :note => "Note"
      )
    ])
  end

  it "renders a list of rules" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "Note".to_s, :count => 2
  end
end
