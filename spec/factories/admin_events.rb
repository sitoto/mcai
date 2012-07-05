# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :admin_event, :class => 'Admin::Event' do
    name "MyString"
    status "MyString"
    created_at "2012-07-05 18:49:07"
  end
end
