require 'spec_helper'

describe "novels/index" do
  before(:each) do
    assign(:novels, [
      stub_model(Novel,
        :name => "Name",
        :author => "Author",
        :published => false
      ),
      stub_model(Novel,
        :name => "Name",
        :author => "Author",
        :published => false
      )
    ])
  end

  it "renders a list of novels" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Author".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
