require 'spec_helper'

describe "weixins/edit" do
  before(:each) do
    @weixin = assign(:weixin, stub_model(Weixin,
      :name => "MyString",
      :ask => "MyString",
      :answer => "MyString",
      :words_count => ""
    ))
  end

  it "renders the edit weixin form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", weixin_path(@weixin), "post" do
      assert_select "input#weixin_name[name=?]", "weixin[name]"
      assert_select "input#weixin_ask[name=?]", "weixin[ask]"
      assert_select "input#weixin_answer[name=?]", "weixin[answer]"
      assert_select "input#weixin_words_count[name=?]", "weixin[words_count]"
    end
  end
end
