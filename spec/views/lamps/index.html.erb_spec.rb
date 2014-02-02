require 'spec_helper'

describe "lamps/index" do
  before(:each) do
    assign(:lamps, [
      stub_model(Lamp,
        :emaker => "Emaker",
        :maker => "Maker",
        :model => "Model",
        :begin_year => "Begin Year",
        :end_year => "End Year",
        :high_beam => "High Beam",
        :low_beam => "Low Beam",
        :fog_light => "Fog Light",
        :front_signal => "Front Signal",
        :front_turn_signal => "Front Turn Signal",
        :rear_turn_signal => "Rear Turn Signal",
        :rear_turn_signal => "Rear Turn Signal",
        :brake_light => "Brake Light",
        :side_turn_signal => "Side Turn Signal",
        :note => "Note"
      ),
      stub_model(Lamp,
        :emaker => "Emaker",
        :maker => "Maker",
        :model => "Model",
        :begin_year => "Begin Year",
        :end_year => "End Year",
        :high_beam => "High Beam",
        :low_beam => "Low Beam",
        :fog_light => "Fog Light",
        :front_signal => "Front Signal",
        :front_turn_signal => "Front Turn Signal",
        :rear_turn_signal => "Rear Turn Signal",
        :rear_turn_signal => "Rear Turn Signal",
        :brake_light => "Brake Light",
        :side_turn_signal => "Side Turn Signal",
        :note => "Note"
      )
    ])
  end

  it "renders a list of lamps" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Emaker".to_s, :count => 2
    assert_select "tr>td", :text => "Maker".to_s, :count => 2
    assert_select "tr>td", :text => "Model".to_s, :count => 2
    assert_select "tr>td", :text => "Begin Year".to_s, :count => 2
    assert_select "tr>td", :text => "End Year".to_s, :count => 2
    assert_select "tr>td", :text => "High Beam".to_s, :count => 2
    assert_select "tr>td", :text => "Low Beam".to_s, :count => 2
    assert_select "tr>td", :text => "Fog Light".to_s, :count => 2
    assert_select "tr>td", :text => "Front Signal".to_s, :count => 2
    assert_select "tr>td", :text => "Front Turn Signal".to_s, :count => 2
    assert_select "tr>td", :text => "Rear Turn Signal".to_s, :count => 2
    assert_select "tr>td", :text => "Rear Turn Signal".to_s, :count => 2
    assert_select "tr>td", :text => "Brake Light".to_s, :count => 2
    assert_select "tr>td", :text => "Side Turn Signal".to_s, :count => 2
    assert_select "tr>td", :text => "Note".to_s, :count => 2
  end
end
