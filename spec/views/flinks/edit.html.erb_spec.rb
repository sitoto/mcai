require 'spec_helper'

describe "flinks/edit" do
  before(:each) do
    @flink = assign(:flink, stub_model(Flink,
      :name => "MyString",
      :image => "MyString",
      :description => "MyString"
    ))
  end

  it "renders the edit flink form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", flink_path(@flink), "post" do
      assert_select "input#flink_name[name=?]", "flink[name]"
      assert_select "input#flink_image[name=?]", "flink[image]"
      assert_select "input#flink_description[name=?]", "flink[description]"
    end
  end
end
