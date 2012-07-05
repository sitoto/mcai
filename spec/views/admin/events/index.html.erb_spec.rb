require 'spec_helper'

describe "admin/events/index" do
  before(:each) do
    assign(:admin_events, [
      stub_model(Admin::Event,
        :name => "Name",
        :status => "Status"
      ),
      stub_model(Admin::Event,
        :name => "Name",
        :status => "Status"
      )
    ])
  end

  it "renders a list of admin/events" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Status".to_s, :count => 2
  end
end
