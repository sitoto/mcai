# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :novel do
    name "MyString"
    author "MyString"
    published false
  end
end
