require 'spec_helper'

describe "admin/tasks/new" do
  before(:each) do
    assign(:admin_task, stub_model(Admin::Task,
      :name => "MyString",
      :type => "",
      :status => "MyString",
      :assign => "MyString",
      :content => "MyString"
    ).as_new_record)
  end

  it "renders new admin_task form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => admin_tasks_path, :method => "post" do
      assert_select "input#admin_task_name", :name => "admin_task[name]"
      assert_select "input#admin_task_type", :name => "admin_task[type]"
      assert_select "input#admin_task_status", :name => "admin_task[status]"
      assert_select "input#admin_task_assign", :name => "admin_task[assign]"
      assert_select "input#admin_task_content", :name => "admin_task[content]"
    end
  end
end
