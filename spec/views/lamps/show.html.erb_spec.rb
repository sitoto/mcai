require 'spec_helper'

describe "lamps/show" do
  before(:each) do
    @lamp = assign(:lamp, stub_model(Lamp,
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
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Emaker/)
    rendered.should match(/Maker/)
    rendered.should match(/Model/)
    rendered.should match(/Begin Year/)
    rendered.should match(/End Year/)
    rendered.should match(/High Beam/)
    rendered.should match(/Low Beam/)
    rendered.should match(/Fog Light/)
    rendered.should match(/Front Signal/)
    rendered.should match(/Front Turn Signal/)
    rendered.should match(/Rear Turn Signal/)
    rendered.should match(/Rear Turn Signal/)
    rendered.should match(/Brake Light/)
    rendered.should match(/Side Turn Signal/)
    rendered.should match(/Note/)
  end
end
