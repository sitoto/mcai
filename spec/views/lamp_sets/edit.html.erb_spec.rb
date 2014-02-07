require 'spec_helper'

describe "lamp_sets/edit" do
  before(:each) do
    @lamp_set = assign(:lamp_set, stub_model(LampSet,
      :name => "MyString",
      :style => "MyString",
      :note => "MyString"
    ))
  end

  it "renders the edit lamp_set form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", lamp_set_path(@lamp_set), "post" do
      assert_select "input#lamp_set_name[name=?]", "lamp_set[name]"
      assert_select "input#lamp_set_style[name=?]", "lamp_set[style]"
      assert_select "input#lamp_set_note[name=?]", "lamp_set[note]"
    end
  end
end
