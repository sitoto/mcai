require 'spec_helper'

describe "weixins/show" do
  before(:each) do
    @weixin = assign(:weixin, stub_model(Weixin,
      :name => "Name",
      :ask => "Ask",
      :answer => "Answer",
      :words_count => ""
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Ask/)
    rendered.should match(/Answer/)
    rendered.should match(//)
  end
end
