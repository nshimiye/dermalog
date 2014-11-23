FactoryGirl.define do
	factory :doctor do
		email "foo@foo.com" 
    password "secret"
    password_confirmation "secret"
    name "robert"
    state "RN"
    license "9090"
  end

  factory :case_log do
    title "acne"
    patient_name "rudolph"
    images []
  end

  factory :image do
    url "http://image.png"
    title "image1"
  end
end
