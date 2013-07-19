require 'spec_helper'

describe "tasks/show" do
  before(:each) do
    @task = assign(:task, stub_model(Task,
      :name => "Name",
      :web_url => "Web Url",
      :verification => false,
      :status => "Status",
      :exec_num => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Web Url/)
    rendered.should match(/false/)
    rendered.should match(/Status/)
    rendered.should match(/1/)
  end
end
