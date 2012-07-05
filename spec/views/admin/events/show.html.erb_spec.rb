require 'spec_helper'

describe "admin/events/show" do
  before(:each) do
    @admin_event = assign(:admin_event, stub_model(Admin::Event,
      :name => "Name",
      :status => "Status"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Status/)
  end
end
