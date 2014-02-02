require 'spec_helper'

describe "weixins/index" do
  before(:each) do
    assign(:weixins, [
      stub_model(Weixin,
        :name => "Name",
        :ask => "Ask",
        :answer => "Answer",
        :words_count => ""
      ),
      stub_model(Weixin,
        :name => "Name",
        :ask => "Ask",
        :answer => "Answer",
        :words_count => ""
      )
    ])
  end

  it "renders a list of weixins" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Ask".to_s, :count => 2
    assert_select "tr>td", :text => "Answer".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
