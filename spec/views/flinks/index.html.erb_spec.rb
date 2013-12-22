require 'spec_helper'

describe "flinks/index" do
  before(:each) do
    assign(:flinks, [
      stub_model(Flink,
        :name => "Name",
        :image => "Image",
        :description => "Description"
      ),
      stub_model(Flink,
        :name => "Name",
        :image => "Image",
        :description => "Description"
      )
    ])
  end

  it "renders a list of flinks" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Image".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
  end
end
