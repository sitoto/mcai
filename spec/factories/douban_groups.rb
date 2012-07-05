# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :douban_group do
    title "MyString"
    keywords "MyString"
    description "MyString"
    body "MyText"

	def	init(first_url = "http://www.rubypulse.com/")
		@first_url = first_url
	end

	def putstitle
		Spidr.site(@first_url) do |spider|
			spider.every_html_page do |page|
				puts page.title
			end
		end
	end
	

  end
end
