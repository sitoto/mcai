require 'spec_helper'

describe Page do
	let(:page) { FactoryGirl.create(:page) }
	it "should covert body with Markdown on create" do
    t = Factory(:page, :body => "*foo*")
    t.body.should == "*foo*"
  end
end
