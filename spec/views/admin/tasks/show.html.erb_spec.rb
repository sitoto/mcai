require 'spec_helper'

describe "admin/tasks/show" do
  before(:each) do
    @admin_task = assign(:admin_task, stub_model(Admin::Task,
      :name => "Name",
      :type => "Type",
      :status => "Status",
      :assign => "Assign",
      :content => "Content"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Type/)
    rendered.should match(/Status/)
    rendered.should match(/Assign/)
    rendered.should match(/Content/)
  end
end
