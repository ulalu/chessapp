FactoryBot.define do
  factory :user do
    sequence :email do |n|
      "dummyEmail#{n}@gmail.com"
    end
    password "secretPassword"
    password_confirmation "secretPassword"
  end
  
  factory :game do
    name "funkychess"
    association :user
  end
  
  factory :piece do
    type 'Rook'
    board_id 1
    special 'none'
    color 'white'
    position_x 0
    position_y 0
  end
  
end