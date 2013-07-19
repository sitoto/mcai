require 'spec_helper'

describe "rules/new" do
  before(:each) do
    assign(:rule, stub_model(Rule,
      :name => "MyString",
      :url_regular => "",
      :note => "MyString"
    ).as_new_record)
  end

  it "renders new rule form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => rules_path, :method => "post" do
      assert_select "input#rule_name", :name => "rule[name]"
      assert_select "input#rule_url_regular", :name => "rule[url_regular]"
      assert_select "input#rule_note", :name => "rule[note]"
    end
  end
end
