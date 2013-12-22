require 'spec_helper'

describe "flinks/show" do
  before(:each) do
    @flink = assign(:flink, stub_model(Flink,
      :name => "Name",
      :image => "Image",
      :description => "Description"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Image/)
    rendered.should match(/Description/)
  end
end
