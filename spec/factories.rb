#FactoryGirl.define do
 # factory :account do
 #  email { Faker::Internet.email }
 #   password "password"
 #   password_confirmation "password"
 #   confirmed_at Date.today
 # end
#end


# This will guess the User class
FactoryGirl.define do
  factory :user do
    first_name 'John'
    last_name  'Doe'
    email 'joe.doe@example.com'
    id '2'
    password '12345test7'
    admin false
  end

  # This will use the User class (Admin would have been guessed)
  factory :admin, class: User do
    first_name 'Admin'
    last_name  'User'
    admin      true
  end

  factory :product do
    name 'Not nice Test Bike'
    description 'This Bike is green test Bike'
    colour 'green'
    price '120 Euro'
  end

  factory :comment do
    user_id '2'
    body 'This is not nice'    
    rating '1'
    product_id '1'
  end

  factory :order do
    user_id '1'
    product_id '1'
    total '120 Euro'
  end

end