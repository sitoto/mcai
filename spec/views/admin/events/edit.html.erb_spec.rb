require 'spec_helper'

describe "admin/events/edit" do
  before(:each) do
    @admin_event = assign(:admin_event, stub_model(Admin::Event,
      :name => "MyString",
      :status => "MyString"
    ))
  end

  it "renders the edit admin_event form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => admin_events_path(@admin_event), :method => "post" do
      assert_select "input#admin_event_name", :name => "admin_event[name]"
      assert_select "input#admin_event_status", :name => "admin_event[status]"
    end
  end
end
