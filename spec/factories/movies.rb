FactoryGirl.define do
  factory :movie do
    title    "MyString"
    rating   {["G", "PG", "PG-13", "R", "NC-17"].sample}
    plot     "Dummy movie text"
  end

end
