require 'spec_helper'

describe "admin/tasks/index" do
  before(:each) do
    assign(:admin_tasks, [
      stub_model(Admin::Task,
        :name => "Name",
        :type => "Type",
        :status => "Status",
        :assign => "Assign",
        :content => "Content"
      ),
      stub_model(Admin::Task,
        :name => "Name",
        :type => "Type",
        :status => "Status",
        :assign => "Assign",
        :content => "Content"
      )
    ])
  end

  it "renders a list of admin/tasks" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Type".to_s, :count => 2
    assert_select "tr>td", :text => "Status".to_s, :count => 2
    assert_select "tr>td", :text => "Assign".to_s, :count => 2
    assert_select "tr>td", :text => "Content".to_s, :count => 2
  end
end
