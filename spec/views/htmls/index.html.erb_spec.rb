require 'spec_helper'

describe "htmls/index" do
  before(:each) do
    assign(:htmls, [
      stub_model(Html,
        :url => "Url",
        :body => "Body"
      ),
      stub_model(Html,
        :url => "Url",
        :body => "Body"
      )
    ])
  end

  it "renders a list of htmls" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Url".to_s, :count => 2
    assert_select "tr>td", :text => "Body".to_s, :count => 2
  end
end
