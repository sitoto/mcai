require 'spec_helper'

describe "htmls/edit" do
  before(:each) do
    @html = assign(:html, stub_model(Html,
      :url => "MyString",
      :body => "MyString"
    ))
  end

  it "renders the edit html form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => htmls_path(@html), :method => "post" do
      assert_select "input#html_url", :name => "html[url]"
      assert_select "input#html_body", :name => "html[body]"
    end
  end
end
