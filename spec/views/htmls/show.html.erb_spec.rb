require 'spec_helper'

describe "htmls/show" do
  before(:each) do
    @html = assign(:html, stub_model(Html,
      :url => "Url",
      :body => "Body"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Url/)
    rendered.should match(/Body/)
  end
end
