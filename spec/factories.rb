#FactoryGirl.define do
#  factory :user do
#    name     "Michael Hartl"
#    email    "michael@example.com"
#    password "foobar"
#    password_confirmation "foobar"
#  end
#end

FactoryGirl.define do
  factory :user do
    sequence(:name)  { |n| "Person #{n}" }
    sequence(:email) { |n| "person_#{n}@example.com"}
    password "foobar"
    password_confirmation "foobar"

    factory :admin do
    	admin true
    end
  end

  factory :author do
  	sequence(:name) { |n| "Name #{n}"}
  end

  factory :piece do
  	sequence(:title) { |n| "Title #{n}"}
  	sequence(:author_id) { |n| 1 }
    sequence(:content) { |n| "Content #{n}"}
  end


end