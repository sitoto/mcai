require 'spec_helper'

describe "novels/show" do
  before(:each) do
    @novel = assign(:novel, stub_model(Novel,
      :name => "Name",
      :author => "Author",
      :published => false
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Author/)
    rendered.should match(/false/)
  end
end
