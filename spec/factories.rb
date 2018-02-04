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
  
  factory :empty_game, class: Game do
    name "funkychess"
    association :user
    after(:create) { |game| game.pieces.destroy_all }
  end
  
  factory :piece do
    type 'Rook'
    special 'none'
    color 'white'
    position_x 0
    position_y 0
    association :game
  end
  
  factory :king do
    
  end
  
  factory :knight do
    color 'black'
  end
  
  factory :pawn do
    position_x 0
    position_y 1
    color 'white'
  end

  factory :bishop do

  end

  factory :rook do

  end

  factory :queen do

  end
  
end