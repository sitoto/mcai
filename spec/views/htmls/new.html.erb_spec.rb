require 'spec_helper'

describe "htmls/new" do
  before(:each) do
    assign(:html, stub_model(Html,
      :url => "MyString",
      :body => "MyString"
    ).as_new_record)
  end

  it "renders new html form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => htmls_path, :method => "post" do
      assert_select "input#html_url", :name => "html[url]"
      assert_select "input#html_body", :name => "html[body]"
    end
  end
end
