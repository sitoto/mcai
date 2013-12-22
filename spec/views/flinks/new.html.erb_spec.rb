require 'spec_helper'

describe "flinks/new" do
  before(:each) do
    assign(:flink, stub_model(Flink,
      :name => "MyString",
      :image => "MyString",
      :description => "MyString"
    ).as_new_record)
  end

  it "renders new flink form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", flinks_path, "post" do
      assert_select "input#flink_name[name=?]", "flink[name]"
      assert_select "input#flink_image[name=?]", "flink[image]"
      assert_select "input#flink_description[name=?]", "flink[description]"
    end
  end
end
