require 'spec_helper'

describe "weixins/new" do
  before(:each) do
    assign(:weixin, stub_model(Weixin,
      :name => "MyString",
      :ask => "MyString",
      :answer => "MyString",
      :words_count => ""
    ).as_new_record)
  end

  it "renders new weixin form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", weixins_path, "post" do
      assert_select "input#weixin_name[name=?]", "weixin[name]"
      assert_select "input#weixin_ask[name=?]", "weixin[ask]"
      assert_select "input#weixin_answer[name=?]", "weixin[answer]"
      assert_select "input#weixin_words_count[name=?]", "weixin[words_count]"
    end
  end
end
