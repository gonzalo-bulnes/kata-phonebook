FactoryGirl.define do
  factory :contact do
    email_address { "#{first_name}.#{last_name}@example.com".downcase }
    first_name "John"
    last_name  "Doe"
    phone_number "+56987654321"
  end

  factory :picture do
    src "/images/rails.png"
  end
end