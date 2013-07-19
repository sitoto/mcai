require 'spec_helper'

describe "tasks/edit" do
  before(:each) do
    @task = assign(:task, stub_model(Task,
      :name => "MyString",
      :web_url => "MyString",
      :verification => false,
      :status => "MyString",
      :exec_num => 1
    ))
  end

  it "renders the edit task form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => tasks_path(@task), :method => "post" do
      assert_select "input#task_name", :name => "task[name]"
      assert_select "input#task_web_url", :name => "task[web_url]"
      assert_select "input#task_verification", :name => "task[verification]"
      assert_select "input#task_status", :name => "task[status]"
      assert_select "input#task_exec_num", :name => "task[exec_num]"
    end
  end
end
