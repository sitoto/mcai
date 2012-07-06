# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :admin_task, :class => 'Admin::Task' do
    name "MyString"
    type ""
    status "MyString"
    assign "MyString"
    content "MyString"
  end
end
