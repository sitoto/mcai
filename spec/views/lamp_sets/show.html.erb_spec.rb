require 'spec_helper'

describe "lamp_sets/show" do
  before(:each) do
    @lamp_set = assign(:lamp_set, stub_model(LampSet,
      :name => "Name",
      :style => "Style",
      :note => "Note"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Style/)
    rendered.should match(/Note/)
  end
end
