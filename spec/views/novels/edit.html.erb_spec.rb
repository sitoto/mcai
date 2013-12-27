require 'spec_helper'

describe "novels/edit" do
  before(:each) do
    @novel = assign(:novel, stub_model(Novel,
      :name => "MyString",
      :author => "MyString",
      :published => false
    ))
  end

  it "renders the edit novel form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", novel_path(@novel), "post" do
      assert_select "input#novel_name[name=?]", "novel[name]"
      assert_select "input#novel_author[name=?]", "novel[author]"
      assert_select "input#novel_published[name=?]", "novel[published]"
    end
  end
end
