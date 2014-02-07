require 'spec_helper'

describe "lamp_sets/index" do
  before(:each) do
    assign(:lamp_sets, [
      stub_model(LampSet,
        :name => "Name",
        :style => "Style",
        :note => "Note"
      ),
      stub_model(LampSet,
        :name => "Name",
        :style => "Style",
        :note => "Note"
      )
    ])
  end

  it "renders a list of lamp_sets" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Style".to_s, :count => 2
    assert_select "tr>td", :text => "Note".to_s, :count => 2
  end
end
