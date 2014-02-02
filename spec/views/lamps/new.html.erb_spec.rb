require 'spec_helper'

describe "lamps/new" do
  before(:each) do
    assign(:lamp, stub_model(Lamp,
      :emaker => "MyString",
      :maker => "MyString",
      :model => "MyString",
      :begin_year => "MyString",
      :end_year => "MyString",
      :high_beam => "MyString",
      :low_beam => "MyString",
      :fog_light => "MyString",
      :front_signal => "MyString",
      :front_turn_signal => "MyString",
      :rear_turn_signal => "MyString",
      :rear_turn_signal => "MyString",
      :brake_light => "MyString",
      :side_turn_signal => "MyString",
      :note => "MyString"
    ).as_new_record)
  end

  it "renders new lamp form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", lamps_path, "post" do
      assert_select "input#lamp_emaker[name=?]", "lamp[emaker]"
      assert_select "input#lamp_maker[name=?]", "lamp[maker]"
      assert_select "input#lamp_model[name=?]", "lamp[model]"
      assert_select "input#lamp_begin_year[name=?]", "lamp[begin_year]"
      assert_select "input#lamp_end_year[name=?]", "lamp[end_year]"
      assert_select "input#lamp_high_beam[name=?]", "lamp[high_beam]"
      assert_select "input#lamp_low_beam[name=?]", "lamp[low_beam]"
      assert_select "input#lamp_fog_light[name=?]", "lamp[fog_light]"
      assert_select "input#lamp_front_signal[name=?]", "lamp[front_signal]"
      assert_select "input#lamp_front_turn_signal[name=?]", "lamp[front_turn_signal]"
      assert_select "input#lamp_rear_turn_signal[name=?]", "lamp[rear_turn_signal]"
      assert_select "input#lamp_rear_turn_signal[name=?]", "lamp[rear_turn_signal]"
      assert_select "input#lamp_brake_light[name=?]", "lamp[brake_light]"
      assert_select "input#lamp_side_turn_signal[name=?]", "lamp[side_turn_signal]"
      assert_select "input#lamp_note[name=?]", "lamp[note]"
    end
  end
end
